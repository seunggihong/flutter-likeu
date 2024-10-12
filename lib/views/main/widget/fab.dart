import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_likeu/utils/app_colors.dart';
import 'package:flutter_likeu/views/camera/camera_view.dart';

/// Views
import 'package:flutter_likeu/views/chart/chart_view.dart';
import 'package:flutter_likeu/views/profile/profile_view.dart';

class Fab extends StatelessWidget {
  const Fab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ExpandableFab(
        type: ExpandableFabType.up,

        /// Open Button settings
        openButtonBuilder: RotateFloatingActionButtonBuilder(
          child: const Icon(Icons.menu),
          fabSize: ExpandableFabSize.regular,
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
        ),

        /// Close Button settings
        closeButtonBuilder: RotateFloatingActionButtonBuilder(
          child: const Icon(Icons.close_sharp),
          fabSize: ExpandableFabSize.regular,
          backgroundColor: Colors.white,
          foregroundColor: AppColors.primaryColor,
        ),

        ///
        overlayStyle: ExpandableFabOverlayStyle(
          color: AppColors.backGroundColor.withOpacity(0.3),
          blur: 5,
        ),
        distance: 70,
        children: [
          /// Open Camera Button
          FloatingActionButton(
            heroTag: null,
            onPressed: () {
              /// Open Camera func
              log("Open Camera");
              Navigator.push(context,
                  CupertinoPageRoute(builder: (_) => const CameraView()));
            },
            backgroundColor: AppColors.primaryColor,
            child: const Icon(
              Icons.camera_alt_outlined,
              color: Colors.white,
              size: 30,
            ),
          ),

          /// Open Chart Button
          FloatingActionButton(
            heroTag: null,
            onPressed: () {
              /// Naviagtor < Chart View >
              log("Open Chart View");
              Navigator.push(context,
                  CupertinoPageRoute(builder: (_) => const ChartView()));
            },
            backgroundColor: AppColors.primaryColor,
            child: const Icon(
              Icons.line_axis,
              color: Colors.white,
              size: 30,
            ),
          ),

          /// Open Profile Button
          FloatingActionButton(
            heroTag: null,
            onPressed: () {
              /// Navigator < Profile View >
              log("Open Profile View");
              Navigator.push(context,
                  CupertinoPageRoute(builder: (_) => const ProfileView()));
            },
            backgroundColor: AppColors.primaryColor,
            child: const Icon(
              Icons.person_outline,
              color: Colors.white,
              size: 30,
            ),
          )
        ]);
  }
}
