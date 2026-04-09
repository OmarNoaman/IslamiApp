import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SuraKey {
  static const mostRecentKey = 'most_recent';
}

class MostRecentProvider extends ChangeNotifier {
  MostRecentProvider() {
    readData();
  }
  List<int> mostRecentList = [];

  void writeData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostRecentStringList = mostRecentList
        .map((index) => index.toString())
        .toList();
    await prefs.setStringList(SuraKey.mostRecentKey, mostRecentStringList);
  }

  void readData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? savedData = prefs.getStringList(SuraKey.mostRecentKey);
    if (savedData != null) {
      mostRecentList = savedData.map((index) => int.parse(index)).toList();
    }
    notifyListeners();
  }

  void addMostRecentSura(int suraIndex) {
    if (mostRecentList.contains(suraIndex)) mostRecentList.remove(suraIndex);
    if (mostRecentList.length >= 3) mostRecentList.removeLast();
    mostRecentList.insert(0, suraIndex);
    writeData();
    notifyListeners();
  }
}
