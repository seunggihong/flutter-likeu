import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:flutter_likeu/extensions/space_exs.dart';
import 'package:flutter_likeu/utils/app_colors.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CustomHeatMapViewer extends StatefulWidget {
  const CustomHeatMapViewer({super.key});

  @override
  State<CustomHeatMapViewer> createState() => _HeatMapViewerState();
}

class _HeatMapViewerState extends State<CustomHeatMapViewer> {
  /// Show Date Time and Accuracy Data sets.

  final hivebox = Hive.box('users');

  Map<DateTime, int> datasets = {};

  /// Heatmap Color sets.
  Map<int, Color> colorsets = AppColors.heatMapColor;

  /// Accuracy.
  int? accuracy = 0;

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
      } else {
        accuracy = datasets[value];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Show Commit Count.
        Text(
          '$accuracy %',
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        25.h,

        /// HeatMap
        Center(
          child: HeatMap(
            startDate: DateTime(DateTime.now().year, DateTime.now().month),
            endDate: DateTime(DateTime.now().year, DateTime.now().month + 3),
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
