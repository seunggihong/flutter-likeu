import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:flutter_likeu/extensions/space_exs.dart';
import 'package:flutter_likeu/utils/app_colors.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class CustomHeatMapMain extends StatefulWidget {
  const CustomHeatMapMain({super.key});

  @override
  State<CustomHeatMapMain> createState() => _CustomHeatMapMain();
}

class _CustomHeatMapMain extends State<CustomHeatMapMain> {
  final hivebox = Hive.box('users');

  final Map<DateTime, int> datasets = {};

  /// Heatmap Color sets.
  Map<int, Color> colorsets = AppColors.heatMapColor;

  /// Accuracy.
  int? accuracy = 0;
  String? dateTime = DateFormat("yyyy-MM-dd").format(DateTime.now()).toString();

  @override
  void initState() {
    if (hivebox.get('percent') != null) {
      List<dynamic> data = hivebox.get('percent');
      for (var element in data) {
        DateTime date = DateTime.parse(element[0]);
        datasets[date] = element[2];
      }
    }
    super.initState();
  }

  /// Show Accuracy.
  void _changeCommitCount(value) {
    setState(() {
      if (datasets[value] == null) {
        accuracy = 0;
        dateTime = DateFormat("yyyy-MM-dd").format(value).toString();
      } else {
        accuracy = datasets[value];
        dateTime = DateFormat("yyyy-MM-dd").format(value).toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Show Commit Count.
        25.h,
        Text(
          dateTime!,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Text(
          '$accuracy%',
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        10.h,

        /// HeatMap
        Center(
          child: HeatMap(
            startDate: DateTime(
              DateTime.now().year,
              DateTime.now().month,
            ),
            endDate: DateTime(
              DateTime.now().year,
              DateTime.now().month + 3,
            ),
            defaultColor: Colors.grey,
            textColor: Colors.white,
            datasets: datasets,
            colorMode: ColorMode.opacity,
            showText: true,
            scrollable: true,
            colorsets: colorsets,
            onClick: (value) {
              _changeCommitCount(value);
            },
          ),
        ),
      ],
    );
  }
}
