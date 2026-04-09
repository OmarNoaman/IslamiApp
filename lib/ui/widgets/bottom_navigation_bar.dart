import 'package:flutter/material.dart';

import '../../core/utils/app_asset.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/size_config.dart';

typedef OnTap = void Function(int);

class BottomBar extends StatelessWidget {
  final OnTap onTap;
  final int currentIndex;

  const BottomBar({super.key, required this.onTap, required this.currentIndex});

  @override
  BottomNavigationBar build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      currentIndex: currentIndex,
      selectedIconTheme: IconThemeData(color: AppColors.white),
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.gold,
      showUnselectedLabels: false,
      unselectedItemColor: AppColors.black,
      selectedItemColor: AppColors.white,
      items: [
        buildBottomBarItem(
          index: 0,
          label: 'Quran',
          imageName: AppImages.iconQuran,
        ),
        buildBottomBarItem(
          index: 1,
          label: 'Hadith',
          imageName: AppImages.iconHadeth,
        ),
        buildBottomBarItem(
          index: 2,
          label: 'Sebha',
          imageName: AppImages.iconSebha,
        ),
        buildBottomBarItem(
          index: 3,
          label: 'Radio',
          imageName: AppImages.iconRadio,
        ),
        buildBottomBarItem(
          index: 4,
          label: 'Time',
          imageName: AppImages.iconTime,
        ),
      ],
    );
  }

  BottomNavigationBarItem buildBottomBarItem({
    required int index,
    required String label,
    required String imageName,
  }) {
    return BottomNavigationBarItem(
      icon: index == currentIndex
          ? Container(
        padding: EdgeInsets.symmetric(vertical: ContextSize.height * 0.007,
            horizontal: ContextSize.width * 0.04),
              decoration: BoxDecoration(
                color: AppColors.blackContainerBg,
                borderRadius: .circular(66),
              ),
              child: ImageIcon(AssetImage(imageName)),
            )
          : ImageIcon(AssetImage(imageName)),
      label: label,
    );
  }
}
