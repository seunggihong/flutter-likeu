import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_likeu/extensions/space_exs.dart';
import 'package:flutter_likeu/utils/app_colors.dart';
import 'package:flutter_likeu/views/main/components/ad_loader.dart';
import 'package:flutter_likeu/views/main/components/chart_loader.dart';
import 'package:flutter_likeu/views/main/components/fab.dart';
import 'package:mrx_charts/mrx_charts.dart';

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

            const UserGraphLoader(),

            /// Player Slider
            20.h,
            const Text(
              'Player',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),

            20.h,
            CarouselSlider(
              options: CarouselOptions(
                height: 350.0,
                // autoPlay: true,
                // autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
                // autoPlayInterval: const Duration(seconds: 5),
                // autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                initialPage: 0,
                scrollDirection: Axis.horizontal,
              ),

              /// Item List
              items: [1, 2, 3, 4, 5].map(
                (i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            10.h,
                            Text(
                              "$i Player Card",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            10.h,

                            /// Plater Image
                            SizedBox(
                              width: 250,
                              height: 250,
                              child: Container(
                                decoration:
                                    const BoxDecoration(color: Colors.white),
                              ),
                            ),

                            /// Like Button
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "$i player name",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.star_border_rounded,
                                    size: 40,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
              ).toList(),
            ),

            100.h,
          ],
        ),
      ),
    );
  }
}
