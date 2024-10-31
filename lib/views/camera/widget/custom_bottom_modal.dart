import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_likeu/extensions/space_exs.dart';
import 'package:flutter_likeu/views/camera/widget/custom_button.dart';
import 'package:flutter_likeu/views/camera/widget/progress_circular.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class CustomBottomModal extends StatelessWidget {
  const CustomBottomModal({
    super.key,
    required this.isLoading,
    required this.percentage,
    required this.selectPlayer,
    required this.userArmDegree,
    required this.userTiming,
  });

  final bool isLoading;
  final int percentage;
  final String? selectPlayer;
  final int userArmDegree;
  final int userTiming;

  @override
  Widget build(BuildContext context) {
    /// Hive Database
    final hivebox = Hive.box('users');

    return Container(
      height: 600,
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(10)),
      child: isLoading
          ? ProgressCircular()
          : Column(
              children: [
                20.h,
                Text(
                  "You are $percentage% like $selectPlayer",
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                20.h,
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "You would need to bend your arms about $userArmDegree degrees more and your timing would need to be about $userTiming second faster to be similar to the $selectPlayer.",
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                20.h,
                CustomButton(
                  function: () {
                    /// 데이터 추가 로직 구성
                    if (hivebox.get('percent') == null) {
                      hivebox.put('percent', [
                        [
                          DateFormat("yyyyMMdd").format(DateTime.now()),
                          selectPlayer,
                          percentage
                        ]
                      ]);
                    } else {
                      List<dynamic> list = hivebox.get('percent');
                      list.add([
                        DateFormat("yyyyMMdd").format(DateTime.now()),
                        selectPlayer,
                        percentage
                      ]);
                      hivebox.put('percent', list);
                    }

                    log("${hivebox.get('percent')}");
                  },
                  buttonName: "Save",
                )
              ],
            ),
    );
  }
}
