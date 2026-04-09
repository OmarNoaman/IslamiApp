import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_asset.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/ui/tabs/time/time_carousel_slider.dart';

import '../../../core/utils/size_config.dart';
import 'azkar_card.dart';

class TimeTab extends StatefulWidget {
  const TimeTab({super.key});

  @override
  State<TimeTab> createState() => _TimeTabState();
}

class _TimeTabState extends State<TimeTab> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: ContextSize.height * 0.02,),
      child: Column(
        spacing: ContextSize.height * 0.02,
        crossAxisAlignment: .start,
        children: [
          Container(
            padding: EdgeInsets.only(top: ContextSize.height * 0.01,),
            height: ContextSize.height * 0.3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.prayTimeBg),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              spacing: ContextSize.height * 0.015,

              children: [
                Row(
                  mainAxisAlignment: .spaceAround,
                  children: [
                    Text('16 Jul,\n2024', style: AppStyles.pureWhite16Bold),
                    Column(
                      children: [
                        Text(
                            'Pray Time', style: AppStyles.black70Opacity20Bold),
                        Text('Tuesday', style: AppStyles.black90Opacity20Bold),
                      ],
                    ),

                    Text(
                      '09 Muh,\n1446',
                      style: AppStyles.pureWhite16Bold,
                      textAlign: .end,
                    ),
                  ],
                ),
                TimeCarouselSlider(),
                Row(
                  mainAxisAlignment: .center,
                  children: [
                    SizedBox(width: ContextSize.width * 0.2,),
                    Text('Next Pray - ', style: AppStyles.black75Opacity16Bold),
                    Text('02:32', style: AppStyles.black16Bold),
                    SizedBox(width: ContextSize.width * 0.1,),
                    IconButton(
                      onPressed: () {
                        isClicked = !isClicked;
                        setState(() {});
                      },
                      icon: Icon(
                        isClicked ? Icons.volume_off : Icons.volume_up,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Text('Azkar', style: AppStyles.white16Bold),
          Expanded(
            child: Row(
              spacing: ContextSize.width * 0.13,
              children: [
                AzkarCard(
                  text: 'Evening Azkar',
                  imageName: AppImages.eveningAzkar,
                ),
                AzkarCard(
                  text: 'Morning Azkar',
                  imageName: AppImages.morningAzkar,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
