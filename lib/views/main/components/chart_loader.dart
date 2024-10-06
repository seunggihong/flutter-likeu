import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_likeu/utils/app_colors.dart';
import 'package:mrx_charts/mrx_charts.dart';

class UserGraphLoader extends StatelessWidget {
  const UserGraphLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: Container(
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(5)),
        child: Chart(
          layers: [
            ChartAxisLayer(
              settings: const ChartAxisSettings(
                x: ChartAxisSettingsAxis(
                  frequency: 1,
                  max: 13,
                  min: 7,
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                y: ChartAxisSettingsAxis(
                  frequency: 20,
                  max: 100,
                  min: 0,
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              labelX: (value) => value.toInt().toString(),
              labelY: (value) => value.toInt().toString(),
            ),
            ChartLineLayer(
              /// Data
              items: List.generate(
                13 - 7 + 1,
                (index) => ChartLineDataItem(
                    value: Random().nextInt(100) + 1, x: index.toDouble() + 7),
              ),
              settings: const ChartLineSettings(
                thickness: 4.0,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
