import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_likeu/extensions/space_exs.dart';
import 'package:flutter_likeu/utils/app_colors.dart';
import 'package:flutter_likeu/views/camera/components/custom_button.dart';

class CameraView extends StatefulWidget {
  const CameraView({super.key});

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
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
