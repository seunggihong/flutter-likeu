import 'package:flutter/material.dart';
import 'package:flutter_likeu/extensions/space_exs.dart';
import 'package:flutter_likeu/utils/app_colors.dart';

class ProgressCircular extends StatelessWidget {
  const ProgressCircular({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(color: Colors.black.withOpacity(.8)),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
            20.h,
            Text(
              "Uploading...",
              style: TextStyle(
                color: Colors.grey,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
