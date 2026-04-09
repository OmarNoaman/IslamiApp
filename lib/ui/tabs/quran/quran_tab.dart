import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/providers/most_recent_provider.dart';
import '../../../core/utils/app_styles.dart';
import '../../../core/utils/size_config.dart';
import '../../widgets/search_field.dart';
import 'most_recent.dart';
import 'vertical_view_list.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  @override
  Widget build(BuildContext context) {
    var mostRecentProvider = Provider.of<MostRecentProvider>(context);
    return Column(
      crossAxisAlignment: .start,
      spacing: ContextSize.height * 0.02,
      children: [
        SearchField(),
        if (mostRecentProvider.mostRecentList.isNotEmpty) MostRecent(),
        Text('Suras List', style: AppStyles.white16Bold),
        VerticalViewList(),
      ],
    );
  }
}
