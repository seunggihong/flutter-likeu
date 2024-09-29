import 'package:flutter/material.dart';

class ChartView extends StatefulWidget {
  const ChartView({super.key});

  @override
  State<ChartView> createState() => _ChartViewState();
}

class _ChartViewState extends State<ChartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chart"),
      ),
      body: const Center(
        child: Text(
          "Chart View",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
