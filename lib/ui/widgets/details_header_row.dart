import 'package:flutter/material.dart';
import 'package:islami_app/ui/widgets/quran_switch.dart';

import '../../core/utils/app_styles.dart';
import '../../core/utils/size_config.dart';
import 'golden_back_button.dart';

class DetailsHeaderRow extends StatelessWidget {
  final String title;
  final bool hasSwitch;

  const DetailsHeaderRow({
    super.key,
    required this.title,
    this.hasSwitch = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ContextSize.width * 0.02,
      ),
      child: Row(
        children: [
          GoldenBackButton(),
          Expanded(
            child: Text(title, style: AppStyles.gold20Bold, textAlign: .center),
          ),
          (hasSwitch) ? QuranSwitch() : SizedBox(
            width: ContextSize.width * 0.1,)
        ],
      ),
    );
  }
}
