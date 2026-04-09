import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_asset.dart';

import '../../../core/utils/app_styles.dart';
import '../../../core/utils/size_config.dart';

class SebhaTab extends StatefulWidget {

  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 30;
  double turns = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: ContextSize.height * 0.02,),
          child: Text(
            'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
            style: AppStyles.white36Bold,
            textAlign: TextAlign.center,
          ),
        ),

        Image.asset(
          AppImages.sibhaHead,
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Transform.rotate(
              angle: turns,
              alignment: Alignment.center,
              child: Image.asset(
                AppImages.sebhaBody,
              ),
            ),
            GestureDetector(
              onTap: () {
                turns -= 15;
                if (counter == 0) {
                  counter = 33;
                } else {
                  counter--;
                }
                setState(() {

                });
              },
              child: Column(
                spacing: ContextSize.height * 0.02,
                children: [
                  SizedBox(height: ContextSize.height * 0.02,),
                  Text(
                    'سبحان الله',
                    style: AppStyles.white36Bold,
                  ),
                  Text(
                    '$counter',
                    style: AppStyles.white36Bold,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}