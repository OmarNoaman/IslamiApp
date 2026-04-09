import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/providers/filter_provider.dart';
import '../../core/utils/app_asset.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_styles.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    var filterProvider = Provider.of<FilterProvider>(context);
    return TextField(
      onChanged: (text) => filterProvider.search(text),
      style: AppStyles.white16Bold,
      cursorColor: AppColors.gold,
      decoration: InputDecoration(
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
        prefixIcon: Image.asset(AppImages.quranIcon),
        hintText: 'Sura Name',
        hintStyle: AppStyles.white16Bold,
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.gold),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
