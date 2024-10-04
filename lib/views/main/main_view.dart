import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_likeu/views/main/components/fab.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("LikeU")),

      /// Open Menu Button
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: const Fab(),

      /// Body
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Text(
                "data",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
