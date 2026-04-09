import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';

class AzkarCard extends StatelessWidget {
  final String text;
  final String imageName;

  const AzkarCard({super.key, required this.text, required this.imageName});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.circular(20),
          border: BoxBorder.all(color: AppColors.gold, width: 2),
        ),
        child: Column(
          children: [
            Image.asset(imageName),
            Text(text, style: AppStyles.pureWhite20Bold),
          ],
        ),
      ),
    );
  }
}
