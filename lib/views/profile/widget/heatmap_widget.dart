import 'dart:math';

import 'package:fl_heatmap/fl_heatmap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_likeu/utils/app_colors.dart';

class HeatMapViewer extends StatefulWidget {
  const HeatMapViewer({super.key});

  @override
  State<HeatMapViewer> createState() => _HeatMapViewerState();
}

class _HeatMapViewerState extends State<HeatMapViewer> {
  HeatmapItem? selectedItem;
  late HeatmapData heatmapData;

  @override
  void initState() {
    _initExampleData();
    super.initState();
  }

  void _initExampleData() {
    const rows = [
      '2022',
      '2023',
      '2024',
    ];
    const columns = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'Mai',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Okt',
      'Nov',
      'Dez',
    ];

    final r = Random();
    const String unit = 'Commit';

    heatmapData = HeatmapData(
      rows: rows,
      columns: columns,
      colorPalette: [
        AppColors.primaryColor.withOpacity(.1),
        AppColors.primaryColor.withOpacity(.3),
        AppColors.primaryColor.withOpacity(.5),
        AppColors.primaryColor.withOpacity(.7),
        AppColors.primaryColor.withOpacity(1)
      ],
      selectedColor: Colors.white,

      /// User History data.
      items: [
        for (int row = 0; row < rows.length; row++)
          for (int col = 0; col < columns.length; col++)
            HeatmapItem(
                value: r.nextDouble(),
                unit: unit,
                xAxisLabel: columns[col],
                yAxisLabel: rows[row]),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final title = selectedItem != null
        ? '${selectedItem!.value.toStringAsFixed(2)} ${selectedItem!.unit}'
        : '--- ${heatmapData.items.first.unit}';
    final subtitle = selectedItem != null
        ? '${selectedItem!.xAxisLabel} ${selectedItem!.yAxisLabel}'
        : '---';

    return Column(
      children: [
        const SizedBox(height: 1),
        const Text(
          "History",
          // textScaleFactor: 1.4,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 17,
          ),
        ),
        Text(
          subtitle,
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(height: 10),
        Heatmap(
          onItemSelectedListener: (HeatmapItem? selectedItem) {
            debugPrint(
                'Item ${selectedItem?.yAxisLabel}/${selectedItem?.xAxisLabel} with value ${selectedItem?.value} selected');
            setState(() {
              this.selectedItem = selectedItem;
            });
          },
          rowsVisible: 5, // Only the first 5 rows are visible
          heatmapData: heatmapData,
        )
      ],
    );
  }
}
