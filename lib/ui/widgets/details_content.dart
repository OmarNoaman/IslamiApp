import 'package:flutter/material.dart';

import '../../core/utils/app_styles.dart';
import '../../core/utils/size_config.dart';

class DetailsContent extends StatelessWidget {
  final String content;
  final int flex;
  final TextStyle textStyle;

  const DetailsContent({
    super.key,
    required this.content,
    this.flex = 1,
    this.textStyle = AppStyles.gold20Bold,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ContextSize.width * 0.02,
          ),
          child: Text(
            content,
            style: textStyle,
            textAlign: .center,
            textDirection: TextDirection.rtl,
          ),
        ),
      ),
    );
  }
}
