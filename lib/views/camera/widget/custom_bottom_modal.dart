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
    required this.userKneeDegree,
  });

  final bool isLoading;
  final int percentage;
  final String? selectPlayer;
  final int userArmDegree;
  final int userKneeDegree;

  @override
  Widget build(BuildContext context) {
    /// Hive Database
    final hivebox = Hive.box('users');

    String text = '';

    if (userArmDegree > 0) {
      text =
          '$selectPlayer와 비슷해지기 위해서는\n - 팔 각도를 $userArmDegree도 정도 더 구부려 보세요!\n';
    } else if (userArmDegree < 0) {
      text =
          '$selectPlayer와 비슷해지기 위해서는\n - 팔 각도를 ${userArmDegree * -1}도 정도 더 펴 보세요!\n';
    }

    if (userKneeDegree > 0) {
      text += '- 다리 각도를 $userKneeDegree도 정도 더 구부려 보세요!';
    } else if (userKneeDegree < 0) {
      text += '- 다리 각도를 ${userKneeDegree * -1}도 정도 더 펴 보세요!';
    }

    return Container(
      height: 600,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: isLoading
          ? ProgressCircular()
          : Column(
              children: [
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
                ),
                20.h,
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    text,
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
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

                    Navigator.pop(context);
                  },
                  buttonName: "저장",
                )
              ],
            ),
    );
  }
}
