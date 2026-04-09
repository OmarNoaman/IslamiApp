import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_asset.dart';

import '../../../core/utils/size_config.dart';
import '../../widgets/details_content.dart';
import '../../widgets/details_header_row.dart';
import '../../widgets/details_title_row.dart';

class HadithDetails extends StatefulWidget {
  const HadithDetails({super.key});

  @override
  State<HadithDetails> createState() => _HadithDetailsState();
}

class _HadithDetailsState extends State<HadithDetails> {
  String englishTitle = '';
  String hadithTitle = '';
  String hadithContent = '';

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    List<String> arguments =
        ModalRoute.of(context)?.settings.arguments as List<String>;
    englishTitle = arguments[0];
    hadithTitle = arguments[1];
    hadithContent = arguments[2];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          spacing: ContextSize.height * 0.02,
          children: [
            DetailsHeaderRow(title: englishTitle),
            DetailsTitleRow(title: hadithTitle),
            DetailsContent(content: hadithContent),
            Image.asset(AppImages.bottomImg),
          ],
        ),
      ),
    );
  }
}
