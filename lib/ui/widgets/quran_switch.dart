import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/providers/sura_details_provider.dart';
import '../../core/utils/app_colors.dart';

class QuranSwitch extends StatefulWidget {
  QuranSwitch({super.key});

  @override
  State<QuranSwitch> createState() => _QuranSwitchState();
}

class _QuranSwitchState extends State<QuranSwitch> {
  @override
  Widget build(BuildContext context) {
    var suraDetailsProvider = Provider.of<SuraDetailsProvider>(context);
    return Switch(
      value: suraDetailsProvider.isSwitched,
      onChanged: (value) => suraDetailsProvider.toggleSwitch(value),
      activeTrackColor: AppColors.gold,
      activeThumbColor: AppColors.white,
      inactiveTrackColor: AppColors.white,
      inactiveThumbColor: AppColors.gold,
    );
  }
}
