import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_likeu/extensions/space_exs.dart';
// import 'package:flutter_likeu/utils/app_colors.dart';
import 'package:flutter_likeu/views/camera/components/custom_button.dart';
import 'package:flutter_likeu/views/camera/components/result_viewer.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
// import 'package:image_picker/image_picker.dart';

class CameraView extends StatefulWidget {
  const CameraView({super.key});

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  File? _image;
  final picker = ImagePicker();

  get getImage => null;

  // List<String> playerName = [
  //   'Stephen Curry',
  //   'Michael Jordan',
  //   'LeBron James',
  //   'Shaquille ONeal',
  //   'Magic Johnson'
  // ];

  // String dropdownItem = 'Stephen Curry';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            60.h,

            /// Image Loader
            _loadPickerImageBox(),

            /// Open Gallery Or Camera Button Widget.
            _loadGalleryOrCameraButton()
          ],
        ));
  }

  /// Image Picker Loader
  Widget _loadPickerImageBox() {
    return SizedBox(
      height: 400,
      child: Center(
        child: Container(
          width: double.infinity,
          height: 500,
          alignment: Alignment.center,
          margin: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: _image == null
              ? const Text(
                  "Selected Video",
                  textAlign: TextAlign.center,
                )
              : Image.file(_image!),
        ),
      ),
    );
  }

  /// Open Gallery Or Camera Button Widget.
  Widget _loadGalleryOrCameraButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButton(
          function: () async {
            final pickedImage =
                await picker.pickImage(source: ImageSource.gallery);
            log("gallery");
            setState(() {
              if (pickedImage != null) {
                _image = File(pickedImage.path);
              }
            });
          },
          buttonName: 'Gallery',
        ),
        20.h,
        CustomButton(
          function: () {
            log('UpLoad');
            if (_image != null) {
              Navigator.push(
                context,
                CupertinoModalBottomSheetRoute(
                    builder: (e) => const ResultViewer(), expanded: false),
              );
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
}
