import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_asset.dart';
import 'package:islami_app/core/utils/app_styles.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/size_config.dart';

class RadioListView extends StatefulWidget {
  const RadioListView({super.key});

  @override
  State<RadioListView> createState() => _RadioListViewState();
}

class _RadioListViewState extends State<RadioListView> {
  final List<String> sheikhName = [
    'Ibrahim Al-Akdar',
    'Akram Alalaqmi',
    'Majed Al-Enezi',
    'Malik shaibat Alhamed',
  ];

  int? selectedIndex;
  int? muteSelectedIndex;
  bool isMuted = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) => Container(
          height: ContextSize.height * 0.15,
          padding: EdgeInsets.only(top: ContextSize.height * 0.02,),
          margin: EdgeInsets.only(top: ContextSize.height * 0.02,),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                selectedIndex == index
                    ? AppImages.radioSampling
                    : AppImages.radioMasjid,
              ),
              alignment: .bottomCenter,
            ),
            borderRadius: BorderRadius.circular(20),
            color: AppColors.gold,
          ),
          child: Column(
            spacing: ContextSize.height * 0.02,
            children: [
              Text(sheikhName[index], style: AppStyles.black20Bold),
              Row(
                mainAxisAlignment: .center,
                children: [
                  SizedBox(width: ContextSize.width * 0.06,),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (selectedIndex == index) {
                          selectedIndex = null;
                        } else {
                          selectedIndex = index;
                        }
                      });
                    },
                    icon: Icon(
                      selectedIndex == index
                          ? Icons.pause
                          : Icons.play_arrow_rounded,
                      size: ContextSize.width * 0.13,
                      color: AppColors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isMuted = !isMuted;
                        muteSelectedIndex = index;
                      });
                    },
                    icon: ImageIcon(
                      AssetImage(
                        muteSelectedIndex == index && isMuted
                            ? AppImages.mutedX
                            : AppImages.volumeHigh,
                      ),
                      color: AppColors.black,
                      size: ContextSize.width * 0.13,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        itemCount: sheikhName.length,
      ),
    );
  }
}
