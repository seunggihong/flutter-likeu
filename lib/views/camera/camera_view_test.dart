import 'package:flutter/material.dart';
import 'package:flutter_likeu/extensions/space_exs.dart';
import 'package:flutter_likeu/utils/app_colors.dart';
import 'package:flutter_likeu/views/camera/components/custom_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class CameraViewTest extends StatefulWidget {
  const CameraViewTest({super.key});

  @override
  State<CameraViewTest> createState() => _CameraViewTestState();
}

class _CameraViewTestState extends State<CameraViewTest> {
  final players = [
    'Select Player',
    'player 1',
    'player 2',
    'player 3',
    'player 4',
    'player 5'
  ];
  String? selectPlayer;

  /// Video Select
  final ImagePicker _picker = ImagePicker();
  XFile? _video;

  @override
  void initState() {
    setState(() {
      selectPlayer = players[0];
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      /// body
      body: SingleChildScrollView(
        child: Column(
          children: [
            60.h,
            Text(
              "What kind of Player?",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            Container(
              alignment: Alignment.center,
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
            Text(
              "Choose your Video!",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
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
            Text(
              "Let's Started!",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            CustomButton(
              function: () {
                Navigator.push(
                    context,
                    CupertinoModalBottomSheetRoute(
                        builder: (e) => Container(
                              height: 600,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                        expanded: false));
              },
              buttonName: 'Upload',
            ),
          ],
        ),
      ),
    );
  }
}
