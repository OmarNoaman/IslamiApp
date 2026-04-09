import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/size_config.dart';

class GoldenBackButton extends StatelessWidget {
  const GoldenBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.pop(context),
      icon: Icon(Icons.arrow_back_rounded),
      color: AppColors.gold,
      style: IconButton.styleFrom(iconSize: ContextSize.width * 0.07,),
    );
  }
}
