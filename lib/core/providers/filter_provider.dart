import 'package:flutter/material.dart';

import '../../ui/tabs/quran/quran_lists.dart';

class FilterProvider extends ChangeNotifier {
  List<int> filterList = List.generate(114, (index) => index);

  bool isValidEnglishText(String text) {
    final RegExp englishRegex = RegExp(r"^[a-zA-Z\s'-]+$");
    return englishRegex.hasMatch(text);
  }

  void search(String text) {
    List<int> tempList = List.generate(114, (index) => index);

    if (isValidEnglishText(text)) {
      filterList = tempList
          .where(
            (suraIndex) => QuranLists.englishQuranSurahs[suraIndex]
                .toUpperCase()
                .contains(text.toUpperCase()),
          )
          .toList();
    } else {
      filterList = tempList
          .where(
            (suraIndex) => QuranLists.arabicQuranSuras[suraIndex]
                .toUpperCase()
                .contains(text.toUpperCase()),
          )
          .toList();
    }

    notifyListeners();
  }
}
