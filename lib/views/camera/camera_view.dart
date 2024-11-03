import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_likeu/extensions/space_exs.dart';
import 'package:flutter_likeu/utils/app_colors.dart';
import 'package:flutter_likeu/views/camera/widget/custom_bottom_modal.dart';
import 'package:flutter_likeu/views/camera/widget/custom_button.dart';
import 'package:flutter_likeu/views/camera/widget/custom_text.dart';
import 'package:flutter_likeu/views/camera/widget/progress_circular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:http/http.dart' as http;
import 'package:hive_flutter/hive_flutter.dart';

class CameraView extends StatefulWidget {
  const CameraView({super.key});

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  final players = ['Select Player', 'booker', 'Comming Soon...'];
  String? selectPlayer;

  /// Video Select
  final ImagePicker _picker = ImagePicker();
  XFile? _video;

  /// Loading
  bool isLoading = false;

  /// User Simillar
  int percentage = 0;
  int userArmDegree = 20;
  int userTiming = 1;

  /// Hive Database
  final hivebox = Hive.box('users');

  @override
  void initState() {
    setState(() {
      selectPlayer = players[0];
    });
    super.initState();
  }

  Future<void> requsetVideoToFlask(XFile videoPath) async {
    String serverUrl = "${dotenv.get("FLASK_URL")}/${selectPlayer!}";
    setState(() {
      isLoading = true;
    });
    if (isLoading) {
      Navigator.push(
          context,
          CupertinoModalBottomSheetRoute(
              builder: (_) => ProgressCircular(), expanded: false));
      try {
        var req = http.MultipartRequest('POST', Uri.parse(serverUrl));
        req.files
            .add(await http.MultipartFile.fromPath('video', videoPath.path));
        var res = await req.send();

        if (res.statusCode == 200) {
          var responseString = await res.stream.bytesToString();
          var jsonRes = json.decode(responseString);

          log("${jsonRes['data'][0]['similarity_percentage_total']}");

          setState(() {
            percentage = jsonRes['data'][0]['similarity_percentage_total'];
          });
        } else {}
      } catch (e) {
        /// loging
      } finally {
        setState(() {
          isLoading = false;
        });
        // ignore: use_build_context_synchronously
        Navigator.pop(context);

        Navigator.push(
          // ignore: use_build_context_synchronously
          context,
          CupertinoModalBottomSheetRoute(
              builder: (_) => CustomBottomModal(
                    isLoading: isLoading,
                    percentage: percentage,
                    selectPlayer: selectPlayer,
                    userArmDegree: userArmDegree,
                    userTiming: userTiming,
                  ),
              expanded: false),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      /// body
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: double.infinity),
          child: Column(
            children: [
              60.h,

              /// Player Select Dropbox
              CustomText(text: "어떤 선수가 되고 싶나요?"),
              Container(
                alignment: Alignment.centerRight,
                width: 200,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: DropdownButton(
                    dropdownColor: Colors.white,
                    iconEnabledColor: AppColors.backGroundColor,
                    borderRadius: BorderRadius.circular(10),
                    value: selectPlayer,
                    items: players
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectPlayer = value!;
                      });
                    },
                  ),
                ),
              ),
              20.h,

              /// Select User Video
              CustomText(text: "비디오를 선택해 주세요!"),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  _video == null ? "SELECT" : "DONE",
                  style: TextStyle(
                      color: _video == null ? Colors.grey : Colors.green,
                      fontWeight: FontWeight.bold),
                ),
              ),
              CustomButton(
                function: () async {
                  final XFile? video =
                      await _picker.pickVideo(source: ImageSource.gallery);
                  setState(() {
                    if (video != null) {
                      _video = video;
                    }
                  });
                },
                buttonName: _video == null ? 'Gallery' : 'Change',
              ),
              20.h,

              /// Upload to Server from Flutter that User Video.
              CustomText(text: "시작!"),
              CustomButton(
                function: () {
                  if (_video != null && selectPlayer != 'Select Player') {
                    requsetVideoToFlask(_video!);
                  } else if (selectPlayer == 'Select Player') {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Choose Player!")));
                  } else if (_video == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Selected Video!"),
                      ),
                    );
                  }
                },
                buttonName: 'Upload',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
