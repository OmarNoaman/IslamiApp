import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islami_app/ui/screens/home_screen.dart';
import 'package:islami_app/ui/screens/on_boarding_screen.dart';
import 'package:islami_app/ui/tabs/hadith/hadith_details.dart';
import 'package:islami_app/ui/tabs/quran/quran_details.dart';
import 'package:provider/provider.dart';

import 'core/providers/filter_provider.dart';
import 'core/providers/most_recent_provider.dart';
import 'core/providers/sura_details_provider.dart';
import 'core/utils/app_colors.dart';
import 'core/utils/route_name.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => MostRecentProvider()),
    ChangeNotifierProvider(create: (context) => FilterProvider()),
    ChangeNotifierProvider(create: (context) => SuraDetailsProvider()),
  ],
      child: IslamiApp()));
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteName.onBoardingScreen,
      routes: {
        RouteName.quranDetailsScreen: (context) => QuranDetails(),
        RouteName.hadithDetailsScreen: (context) => HadithDetails(),
        RouteName.homeScreen: (context) => HomeScreen(),
        RouteName.onBoardingScreen: (context) => OnBoardingScreen(),
      },
      theme: ThemeData(
        fontFamily: 'Janna LT Bold',
        scaffoldBackgroundColor: AppColors.transparent,
      ),
    );
  }
}