import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_likeu/utils/app_colors.dart';

class ADCarouselSlider extends StatelessWidget {
  const ADCarouselSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Color> testList = [
      AppColors.primaryColor,
      AppColors.primaryColor,
      AppColors.primaryColor,
      AppColors.primaryColor,
      AppColors.primaryColor,
    ];

    return CarouselSlider(
      options: CarouselOptions(
        height: 100.0,
        autoPlay: true,
        autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(milliseconds: 1000),
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
                decoration: BoxDecoration(color: testList[i - 1]),
                alignment: Alignment.center,
                child: Text(
                  "$i AD",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          );
        },
      ).toList(),
    );
  }
}
