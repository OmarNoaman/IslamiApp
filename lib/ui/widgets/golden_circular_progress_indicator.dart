import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';

class GoldenCircularProgressIndicator extends StatelessWidget {
  const GoldenCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(color: AppColors.gold));
  }
}
