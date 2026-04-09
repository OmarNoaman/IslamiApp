import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/providers/sura_details_provider.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../../../core/utils/size_config.dart';

class QuranDetailsListView extends StatefulWidget {
  const QuranDetailsListView({super.key});

  @override
  State<QuranDetailsListView> createState() => _QuranDetailsListViewState();
}

class _QuranDetailsListViewState extends State<QuranDetailsListView> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    var suraDetailsProvider = Provider.of<SuraDetailsProvider>(context);
    return ListView.builder(
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => setState(() {
          selectedIndex = index;
        }),
        child: Container(
          margin: EdgeInsets.only(bottom: ContextSize.height * 0.01),
          padding: EdgeInsets.symmetric(vertical: ContextSize.height * 0.015),
          width: double.infinity,
          decoration: BoxDecoration(
            color: selectedIndex == index
                ? AppColors.gold
                : AppColors.transparent,
            borderRadius: BorderRadius.circular(15),
            border: BoxBorder.all(color: AppColors.gold),
          ),
          child: Text(
            suraDetailsProvider.suraVerses[index],
            style: selectedIndex == index
                ? AppStyles.black20Bold
                : AppStyles.gold20Bold,
            textAlign: .center,
          ),
        ),
      ),
      itemCount: suraDetailsProvider.suraVerses.length,
    );
  }
}
