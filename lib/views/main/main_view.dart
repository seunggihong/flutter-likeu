import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

import 'package:flutter_likeu/extensions/space_exs.dart';
import 'package:flutter_likeu/views/main/widget/ad_loader.dart';
// import 'package:flutter_likeu/views/main/widget/chart_loader.dart';
import 'package:flutter_likeu/views/main/widget/fab.dart';
import 'package:flutter_likeu/views/main/widget/player_card.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            20.h,

            /// Custom Carouse Slider For Ad.
            const ADCarouselSlider(),

            20.h,

            /// User Graph
            const Text(
              'Your History',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),

            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //     children: [
            //       Container(
            //         margin: EdgeInsets.all(10),
            //         width: 300,
            //         height: 150,
            //         decoration: BoxDecoration(color: Colors.white),
            //       ),
            //       Container(
            //         margin: EdgeInsets.all(10),
            //         width: 300,
            //         height: 150,
            //         decoration: BoxDecoration(color: Colors.white),
            //       ),
            //       Container(
            //         margin: EdgeInsets.all(10),
            //         width: 300,
            //         height: 150,
            //         decoration: BoxDecoration(color: Colors.white),
            //       )
            //     ],
            //   ),
            // ),

            // const UserGraphLoader(),

            /// Player Slider
            20.h,
            const Text(
              'Player',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),

            20.h,
            const PlayerCard(),

            100.h,
          ],
        ),
      ),
    );
  }
}
