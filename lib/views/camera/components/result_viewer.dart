import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_likeu/extensions/space_exs.dart';
import 'package:flutter_likeu/utils/app_colors.dart';
import 'package:flutter_likeu/views/camera/components/custom_button.dart';
import 'package:hive/hive.dart';

class ResultViewer extends StatefulWidget {
  const ResultViewer({super.key});

  @override
  State<ResultViewer> createState() => _ResultViewerState();
}

class _ResultViewerState extends State<ResultViewer> {
  int percent = Random().nextInt(100);

  final hivebox = Hive.box('users');

  String explaneText =
      'When you compare the postures of Stephen Curry and yours, they are about 20% similar.';

  Color setTextColor() {
    if (percent <= 15) {
      return Colors.red;
    } else if (percent <= 55 && percent >= 16) {
      return Colors.black;
    } else if (percent <= 80 && percent >= 56) {
      return Colors.blue;
    } else if (percent >= 81) {
      return Colors.green;
    }
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            30.h,
            Text(
              '$percent %',
              style: TextStyle(
                color: setTextColor(),
                decoration: TextDecoration.none,
              ),
            ),
            20.h,
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                //height: 300,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Text(
                  'When you compare the postures of Stephen Curry and yours, they are about $percent% similar.',
                  style: const TextStyle(
                    color: Colors.black,
                    decoration: TextDecoration.none,
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            // BarChart(BarChartData())
            CustomButton(
              function: () {
                if (hivebox.get('percent') == null) {
                  hivebox.put('percent', [
                    [DateTime.now(), percent]
                  ]);
                } else {
                  List prev = hivebox.get('percent').toList();
                  prev.add([DateTime.now(), percent]);
                  print(prev);
                  hivebox.put('percent', prev);
                }

                print(hivebox.get('percent'));
                Navigator.pop(context);
              },
              buttonName: 'Save',
            )
          ],
        ),
      ),
    );
  }
}
