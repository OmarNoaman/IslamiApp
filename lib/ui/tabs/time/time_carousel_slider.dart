import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/core/utils/size_config.dart';

class TimeCarouselSlider extends StatefulWidget {

  const TimeCarouselSlider({super.key});

  @override
  State<TimeCarouselSlider> createState() => _TimeCarouselSliderState();
}

class _TimeCarouselSliderState extends State<TimeCarouselSlider> {
  final List<Map<String, String>> prayerData = [
    {'name': 'Fajr', 'time': '04:42', 'period': 'AM'},
    {'name': 'Dhuhr', 'time': '12:05', 'period': 'PM'},
    {'name': 'Asr', 'time': '03:31', 'period': 'PM'},
    {'name': 'Maghrib', 'time': '06:04', 'period': 'PM'},
    {'name': 'Isha', 'time': '07:22', 'period': 'PM'},
  ];
  int selectedIndex = 2;
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          height: isSelected ? ContextSize.height * 0.1 : ContextSize.height *
              0.14,
          viewportFraction: 0.27,
        initialPage: 2,
        scrollDirection: Axis.horizontal,
        enableInfiniteScroll: false,
          onPageChanged: (index, _) {
            setState(() {
              selectedIndex = index;
            });
          }
      ),
      items: prayerData.map((prayer) {
        return Builder(

          builder: (BuildContext context) {
            isSelected = selectedIndex == prayerData.indexOf(prayer);
            return Container(
              width: ContextSize.width,
              margin: EdgeInsets.symmetric(
                  horizontal: ContextSize.width * 0.01),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [AppColors.black, AppColors.gradientGold],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                mainAxisAlignment: .spaceEvenly,
                children: [
                  Text(prayer['name']!,
                      style: isSelected ? AppStyles.pureWhite16Bold : AppStyles
                          .pureWhite14Bold),
                  Text(prayer['time']!,
                      style: isSelected ? AppStyles.pureWhite32Bold : AppStyles
                          .pureWhite24Bold),
                  Text(prayer['period']!,
                      style: isSelected ? AppStyles.pureWhite16Bold : AppStyles
                          .pureWhite14Bold),
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
