import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SuraDetailsProvider extends ChangeNotifier {
  String suraContent = '';
  List<String> suraVerses = [];
  bool isSwitched = false;

  void toggleSwitch(bool value) {
    isSwitched = value;
    notifyListeners();
  }

  Future<void> loadFileData(int index) async {
    suraContent = '';
    suraVerses = [];
    String tempContent = '';

    String content = await rootBundle.loadString(
      'assets/suras/${index + 1}.txt',
    );
    List<String> verses = content.trim().split('\n');

    for (int i = 0; i < verses.length; i++) {
      tempContent += '[${i + 1}] ${verses[i]}';
    }
    suraContent = tempContent;
    suraVerses = verses;

    notifyListeners();
  }
}
