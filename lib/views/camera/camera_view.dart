import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_likeu/extensions/space_exs.dart';
import 'package:flutter_likeu/utils/app_colors.dart';
import 'package:flutter_likeu/views/camera/components/custom_button.dart';
import 'package:image_picker/image_picker.dart';

class CameraView extends StatefulWidget {
  const CameraView({super.key});

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  XFile? path;
  final ImagePicker picker = ImagePicker();

  Future getImage(ImageSource imageSource) async {
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    if (pickedFile != null) {
      setState(() {
        path = XFile(pickedFile.path); //가져온 이미지를 _image에 저장
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
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
                  child: const Text(
                    "Selected Vedio",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),

            /// Open Gallery Or Camera Button Widget.
            _openGalleryOrCameraButtonLoader()
          ],
        ));
  }

  /// Open Gallery Or Camera Button Widget.
  Widget _openGalleryOrCameraButtonLoader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButton(
          function: () {
            /// Open Gallery
            log('open gallery');
            getImage(ImageSource.gallery);
          },
          buttonName: 'Gallery',
        ),
        20.w,
        CustomButton(
          function: () {
            /// Open Camera
            log("open camera");
          },
          buttonName: 'Camera',
        )
      ],
    );
  }
}
