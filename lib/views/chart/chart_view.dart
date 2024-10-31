import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
        showList.add(Container(
          margin: EdgeInsets.all(10),
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(color: Colors.white),
          child: Text(element[1]),
        ));
      }
      log("$percentList");
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
