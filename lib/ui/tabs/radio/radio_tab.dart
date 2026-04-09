import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_colors.dart';

import 'radio_button.dart';
import 'radio_list_view.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.blackOpacity70,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              RadioButton(
                text: 'Radio',
                isSelected: selectedIndex == 0,
                onPressed: () {
                  setState(() {
                    selectedIndex = 0;
                  });
                },
              ),
              RadioButton(
                text: 'Reciters',
                isSelected: selectedIndex == 1,
                onPressed: () {
                  setState(() {
                    selectedIndex = 1;
                  });
                },
              ),
            ],
          ),
        ),
        RadioListView(),
      ],
    );
  }
}
