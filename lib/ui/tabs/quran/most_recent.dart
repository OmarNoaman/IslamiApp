import 'package:flutter/material.dart';
import 'package:islami_app/ui/tabs/quran/quran_lists.dart';
import 'package:provider/provider.dart';

import '../../../core/providers/most_recent_provider.dart';
import '../../../core/utils/app_asset.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../../../core/utils/route_name.dart';
import '../../../core/utils/size_config.dart';

class MostRecent extends StatelessWidget {


  const MostRecent({super.key});

  @override
  Widget build(BuildContext context) {
    var mostRecentProvider = Provider.of<MostRecentProvider>(context);
    return Column(
      crossAxisAlignment: .start,
      spacing: ContextSize.height * 0.01,
      children: [
        Text('Most Recently', style: AppStyles.white16Bold),
        SizedBox(
          height: ContextSize.height * 0.18,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              int currentIndex = mostRecentProvider.mostRecentList[index];
              return InkWell(
                onTap: () =>
                    Navigator.of(
                      context,
                    ).pushNamed(
                        RouteName.quranDetailsScreen, arguments: currentIndex),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: ContextSize.height * 0.02,
                    horizontal: ContextSize.width * 0.06,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.gold,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: .spaceEvenly,
                        crossAxisAlignment: .start,
                        children: [
                          Text(QuranLists.englishQuranSurahs[currentIndex],
                              style: AppStyles.black24Bold),
                          Text(QuranLists.arabicQuranSuras[currentIndex],
                              style: AppStyles.black24Bold),
                          Text('${QuranLists.AyaNumber[currentIndex]} Verses  ',
                              style: AppStyles.black14Bold),
                        ],
                      ),
                      Image.asset(AppImages.mostRecentImg),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) =>
                SizedBox(width: ContextSize.width * 0.03,),
            itemCount: mostRecentProvider.mostRecentList.length,
          ),
        ),
      ],
    );
  }
}
