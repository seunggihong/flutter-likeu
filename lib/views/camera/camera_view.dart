import 'dart:developer';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_likeu/extensions/space_exs.dart';
import 'package:flutter_likeu/views/camera/components/custom_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class CameraView extends StatefulWidget {
  const CameraView({super.key});

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  XFile? _video;
  final ImagePicker _picker = ImagePicker();
  List<List<dynamic>> _csvData = []; // CSV 데이터를 저장할 리스트
  bool _isLoading = false; // 로딩상태 추적

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("CSV Data")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          60.h,
          SizedBox(
            height: 500,
            child: Center(
              child: Container(
                width: double.infinity,
                height: 500,
                alignment: Alignment.center,
                margin: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: _csvData.isEmpty
                    ? const Text("Selected Video", textAlign: TextAlign.center)
                    : ListView.builder(
                        itemCount: _csvData.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text('Frame: ${_csvData[index][0]}'),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Keypoints: ${_csvData[index][1]}'),
                                Text('Elbow Angle: ${_csvData[index][2]}'),
                                Text('Knee Angle: ${_csvData[index][3]}'),
                              ],
                            ),
                          );
                        },
                      ),
              ),
            ),
          ),
          _loadGalleryOrCameraButton(),
          if (_isLoading)
            const CircularProgressIndicator(), // Show loading indicator
        ],
      ),
    );
  }

  Widget _loadGalleryOrCameraButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButton(
          function: () async {
            log('open gallery');
            final XFile? video =
                await _picker.pickVideo(source: ImageSource.gallery);
            setState(() {
              if (video != null) {
                _video = video;
              }
            });
          },
          buttonName: 'Gallery',
        ),
        20.h,
        CustomButton(
          function: () {
            log('UpLoad');
            if (_video != null) {
              requestVideoToFlask(_video!);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Selected Video!"),
                ),
              );
            }
          },
          buttonName: 'UpLoad',
        )
      ],
    );
  }

  Future<void> requestVideoToFlask(XFile videoPath) async {
    // Flask_url을 dotenv에 작성해서 사용함
    String serverUrl = dotenv.get("FLASK_URL");

    setState(() {
      _isLoading = true; // Start loading
    });

    try {
      var request = http.MultipartRequest('POST', Uri.parse(serverUrl));
      request.files
          .add(await http.MultipartFile.fromPath('video', videoPath.path));

      var response = await request.send();

      if (response.statusCode == 200) {
        // Save CSV file
        final bytes = await response.stream.toBytes();
        final directory = await getApplicationDocumentsDirectory();
        final csvFile = File('${directory.path}/output.csv');
        await csvFile.writeAsBytes(bytes);

        // Log CSV file path
        log('CSV file saved at: ${csvFile.path}');

        // Read CSV file content
        List<List<dynamic>> csvContent = await _readCsvFile(csvFile);
        setState(() {
          _csvData = csvContent;
        });
      } else {
        log('Server error: ${response.statusCode}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: ${response.statusCode}")),
        );
      }
    } catch (e) {
      log('Error sending video to Flask: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to upload video")),
      );
    } finally {
      setState(() {
        _isLoading = false; // Stop loading
      });
    }
  }

  Future<List<List<dynamic>>> _readCsvFile(File file) async {
    final contents = await file.readAsString();
    List<List<dynamic>> rows = const CsvToListConverter().convert(contents);

    // keypoints 문자열을 읽어와서 변환
    for (var i = 1; i < rows.length; i++) {
      // 첫 번째 줄은 헤더이므로 1부터 시작
      String keypointsStr = rows[i][1].toString();
      keypointsStr = keypointsStr
          .replaceAll('np.float32(', '')
          .replaceAll(')', '')
          .replaceAll(' ', ''); // 불필요한 공백 제거

      rows[i][1] = keypointsStr; // 변환된 keypoints 문자열을 넣습니다.
    }

    return rows;
  }
}
