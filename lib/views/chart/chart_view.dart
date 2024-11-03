import 'package:awesome_circular_chart/awesome_circular_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_likeu/extensions/space_exs.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class ChartView extends StatefulWidget {
  const ChartView({super.key});

  @override
  State<ChartView> createState() => _ChartViewState();
}

class _ChartViewState extends State<ChartView> {
  final hivebox = Hive.box('users');

  List<Container> showList = [];

  @override
  void initState() {
    if (hivebox.get('percent') != null) {
      List<dynamic> percentList = hivebox.get('percent');
      for (var element in percentList) {
        showList.add(
          Container(
            margin: EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                20.h,
                Text(
                  DateFormat("yyyy년 MM월 dd일")
                      .format(DateTime.parse((element[0]))),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(element[1]),
                AnimatedCircularChart(
                  size: const Size(150, 150),
                  initialChartData: <CircularStackEntry>[
                    CircularStackEntry(
                      <CircularSegmentEntry>[
                        CircularSegmentEntry(
                          element[2].toDouble(),
                          Colors.green,
                          rankKey: 'completed',
                        ),
                        CircularSegmentEntry(
                          100.0 - element[2].toDouble(),
                          Colors.blueGrey[600],
                          rankKey: 'remaining',
                        ),
                      ],
                      rankKey: 'progress',
                    ),
                  ],
                  chartType: CircularChartType.Radial,
                  percentageValues: true,
                  holeLabel: "${element[2]}%",
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
                20.h,
              ],
            ),
          ),
        );
      }
    } else {
      showList.add(Container(
          decoration: BoxDecoration(color: Colors.white),
          width: 300,
          height: 300,
          child: Text(
            "No Data",
            style: TextStyle(color: Colors.white),
          )));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chart"),
      ),
      body: Center(
          child: ListView.builder(
        itemBuilder: (context, index) {
          return showList[index];
        },
        itemCount: showList.length,
      )),
    );
  }
}
