<<<<<<< HEAD
import 'dart:developer';
=======
>>>>>>> f9a61c1c3ae982997cb8e4467f6dd9eb50c31b85
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
    required this.userKneeDegree,
  });

  final bool isLoading;
  final int percentage;
  final String? selectPlayer;
  final int userArmDegree;
  final int userKneeDegree;

  @override
  Widget build(BuildContext context) {
    final hivebox = Hive.box('users');

    String text = '';

    if (userArmDegree > 0) {
      text =
          '$selectPlayer와 비슷해지기 위해서는\n - 팔 각도를 $userArmDegree° 정도 더 구부려 보세요!\n';
    } else if (userArmDegree < 0) {
      text =
          '$selectPlayer와 비슷해지기 위해서는\n - 팔 각도를 ${userArmDegree * -1}° 정도 더 펴 보세요!\n';
    }

    if (userKneeDegree > 0) {
      text += '- 다리 각도를 $userKneeDegree° 정도 더 구부려 보세요!';
    } else if (userKneeDegree < 0) {
      text += '- 다리 각도를 ${userKneeDegree * -1}° 정도 더 펴 보세요!';
    }

    return Container(
      height: 600,
      decoration: BoxDecoration(
<<<<<<< HEAD
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
=======
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
>>>>>>> f9a61c1c3ae982997cb8e4467f6dd9eb50c31b85
      child: isLoading
          ? ProgressCircular()
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
<<<<<<< HEAD
                Icon(
                  Icons.sports_basketball,
                  color: Colors.orangeAccent,
                  size: 50,
=======
                50.h,
                Image.asset(
                  'assets/basketball.png',
                  width: 50,
                  height: 50,
                ),
                20.h,
                Text(
                  "당신은 $selectPlayer 선수와 \n$percentage% 비슷해요!",
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.center,
>>>>>>> f9a61c1c3ae982997cb8e4467f6dd9eb50c31b85
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
<<<<<<< HEAD
                    "$selectPlayer 선수와 비슷해지려면:\n"
                    "- 팔을 $userArmDegree° 더 구부리세요.\n"
                    "- 타이밍을 약 $userTiming초 더 빠르게 맞추세요.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      fontFamily: 'Roboto',
=======
                    text,
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
>>>>>>> f9a61c1c3ae982997cb8e4467f6dd9eb50c31b85
                    ),
                    textAlign: TextAlign.center,
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
                          percentage,
                          userArmDegree,
                          userKneeDegree
                        ]
                      ]);
                    } else {
                      List<dynamic> list = hivebox.get('percent');
                      list.add([
                        DateFormat("yyyyMMdd").format(DateTime.now()),
                        selectPlayer,
                        percentage,
                        userArmDegree,
                        userKneeDegree
                      ]);
                      hivebox.put('percent', list);
                    }
<<<<<<< HEAD
                    log("${hivebox.get('percent')}");
                  },
                  child: Text("저장"),
                ),
=======

                    Navigator.pop(context);
                  },
                  buttonName: "저장",
                )
>>>>>>> f9a61c1c3ae982997cb8e4467f6dd9eb50c31b85
              ],
            ),
    );
  }
}
