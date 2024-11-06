import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_likeu/extensions/space_exs.dart';
import 'package:flutter_likeu/utils/app_colors.dart';

class PlayerCard extends StatelessWidget {
  const PlayerCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> playerName = [
      'Devin Booker',
      // 'Michael Jordan',
      // 'LeBron James',
      // 'Shaquille ONeal',
      // 'Magic Johnson',
      'Comming Soon...'
    ];

    List<String> playerImage = [
      'assets/imgs/booker.jpg',
      // 'assets/imgs/Jordan.jpg',
      // 'assets/imgs/LeBron.jpg',
      // 'assets/imgs/ONeal.jpg',
      // 'assets/imgs/Johnson.jpg',
      'assets/imgs/comming_soon.jpg'
    ];

    return CarouselSlider(
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
      items: [1, 2].map(
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
                      playerName[i - 1],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    10.h,

                    /// Plater Image
                    SizedBox(
                        width: 250,
                        height: 250,
                        child: Image.asset(playerImage[i - 1])),

                    /// Like Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          playerName[i - 1],
                          style: const TextStyle(fontWeight: FontWeight.bold),
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
    );
  }
}
