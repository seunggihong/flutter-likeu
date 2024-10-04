import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:flutter_likeu/extensions/space_exs.dart';
import 'package:flutter_likeu/utils/app_colors.dart';

class CustomHeatMapViewer extends StatefulWidget {
  const CustomHeatMapViewer({super.key});

  @override
  State<CustomHeatMapViewer> createState() => _HeatMapViewerState();
}

class _HeatMapViewerState extends State<CustomHeatMapViewer> {
  /// Show Date Time and Commit Count Data sets.
  /// Change Later that Load REST API Data.
  Map<DateTime, int> datasets = {
    DateTime(2024, 9, 1): 1,
    DateTime(2024, 9, 2): 2,
    DateTime(2024, 9, 3): 3,
    DateTime(2024, 9, 4): 4,
    DateTime(2024, 9, 5): 5,
    DateTime(2024, 9, 6): 10,
  };

  /// Heatmap Color sets.
  Map<int, Color> colorsets = AppColors.heatMapColor;

  /// Commit Count.
  int? commit = 0;

  /// Show Commit Count.
  void _changeCommitCount(value) {
    setState(() {
      if (datasets[value] == null) {
        commit = 0;
      } else {
        commit = datasets[value];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Show Commit Count.
        Text(
          '$commit commit',
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        25.h,

        /// HeatMap
        Center(
          child: HeatMap(
            startDate: DateTime(2024, 7),
            endDate: DateTime.now(),
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
