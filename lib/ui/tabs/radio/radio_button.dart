import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_styles.dart';

import '../../../core/utils/app_colors.dart';

class RadioButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onPressed;

  const RadioButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: isSelected ? AppColors.gold : AppColors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(12),
          ),
        ),
        child: Text(
          text,
          style: isSelected ? AppStyles.black16Regular : AppStyles.white16Bold,
        ),
      ),
    );
  }
}
