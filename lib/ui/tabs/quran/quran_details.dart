import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_asset.dart';
import 'package:islami_app/ui/tabs/quran/quran_details_list_view.dart';
import 'package:islami_app/ui/tabs/quran/quran_lists.dart';
import 'package:provider/provider.dart';

import '../../../core/providers/sura_details_provider.dart';
import '../../../core/utils/size_config.dart';
import '../../widgets/details_content.dart';
import '../../widgets/details_header_row.dart';
import '../../widgets/details_title_row.dart';
import '../../widgets/golden_circular_progress_indicator.dart';

class QuranDetails extends StatefulWidget {
  const QuranDetails({super.key});

  @override
  State<QuranDetails> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<QuranDetails> {
  int? currentIndex;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    WidgetsFlutterBinding.ensureInitialized();

    final index = ModalRoute.of(context)?.settings.arguments as int;

    if (currentIndex != index) {
      Provider.of<SuraDetailsProvider>(
        context,
        listen: false,
      ).loadFileData(index);
    }
    currentIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    var suraDetailsProvider = Provider.of<SuraDetailsProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          spacing: ContextSize.height * 0.02,
          children: [
            DetailsHeaderRow(
              title: QuranLists.englishQuranSurahs[currentIndex ?? 0],
              hasSwitch: true,
            ),
            DetailsTitleRow(
                title: QuranLists.arabicQuranSuras[currentIndex ?? 0]),

            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ContextSize.width * 0.03,
                ),
                child: suraDetailsProvider.suraVerses.isEmpty
                    ? GoldenCircularProgressIndicator()
                    : suraDetailsProvider.isSwitched
                    ? DetailsContent(content: suraDetailsProvider.suraContent)
                    : QuranDetailsListView(),
              ),
            ),
            Image.asset(AppImages.bottomImg),
          ],
        ),
      ),
    );
  }
}
