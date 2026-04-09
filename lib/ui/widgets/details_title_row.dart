import 'package:flutter/material.dart';

import '../../core/utils/app_asset.dart';
import '../../core/utils/app_styles.dart';
import '../../core/utils/size_config.dart';

class DetailsTitleRow extends StatelessWidget {
  final String title;

  const DetailsTitleRow({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ContextSize.width * 0.03,
      ),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Image.asset(AppImages.leftCorner),
          Expanded(
            child: Text(title, style: AppStyles.gold20Bold, textAlign: .center),
          ),
          Image.asset(AppImages.rightCorner),
        ],
      ),
    );
  }
}
