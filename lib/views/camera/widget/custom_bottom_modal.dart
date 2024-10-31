import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_likeu/extensions/space_exs.dart';
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
    final hivebox = Hive.box('users');

    return Container(
      height: 600,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      child: isLoading
          ? ProgressCircular()
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.sports_basketball,
                  color: Colors.orangeAccent,
                  size: 50,
                ),
                20.h,
                Text(
                  "당신은 $selectPlayer 선수와 $percentage% 유사합니다!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 28,
                    fontFamily: 'Roboto',
                  ),
                ),
                30.h,
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "$selectPlayer 선수와 비슷해지려면:\n"
                    "- 팔을 $userArmDegree° 더 구부리세요.\n"
                    "- 타이밍을 약 $userTiming초 더 빠르게 맞추세요.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
                40.h,
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent, // 버튼 배경 색상
                    foregroundColor: Colors.white, // 텍스트 색상
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
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
                  child: Text("저장"),
                ),
              ],
            ),
    );
  }
}
