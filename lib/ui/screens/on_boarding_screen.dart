import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami_app/core/utils/app_asset.dart';
import 'package:islami_app/core/utils/app_colors.dart';

import '../../core/utils/app_styles.dart';
import '../../core/utils/size_config.dart';
import 'home_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(BuildContext context) {
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (_) => const HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: AppColors.black,
      // allowImplicitScrolling: true,
      // autoScrollDuration: 2000,
      // infiniteAutoScroll: true,
      globalHeader: SafeArea(
        child: Image.asset(AppImages.headerIslamiImg, width: double.infinity),
      ),

      pages: [
        buildPageViewModel(
            firstText: "Welcome To Islmi App",
            secondText: "",
            assetName: AppImages.welcome,
            isFirst: true
        ),

        buildPageViewModel(
          firstText: "Welcome To Islami",
          secondText: "We Are Very Excited To Have You In Our Community",
          assetName: AppImages.kebba,
        ),
        buildPageViewModel(
          firstText: "Reading the Quran",
          secondText: "Read, and your Lord is the Most Generous",
          assetName: AppImages.quran,
        ),
        buildPageViewModel(
          firstText: "Bearish",
          secondText: "Praise the name of your Lord, the Most High",
          assetName: AppImages.bearish,
        ),
        buildPageViewModel(
          firstText: "Holy Quran Radio",
          secondText:
              "You can listen to the Holy Quran Radio through the application for free and easily",
          assetName: AppImages.quranRadio,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      showSkipButton: false,
      showFirstBackButton: false,
      showBackButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      animationDuration: 1000,
      curve: Curves.easeInOut,
      back: const Text('Back', style: AppStyles.gold16Bold),
      next: const Text('Next', style: AppStyles.gold16Bold),
      done: const Text('Finish', style: AppStyles.gold16Bold),

      controlsMargin: EdgeInsets.only(bottom: ContextSize.height * 0.01,),
      dotsDecorator: DotsDecorator(
        size: Size(
          ContextSize.width * 0.02, ContextSize.height * 0.01,),
        color: AppColors.grey,
        activeSize: Size(
          ContextSize.width * 0.05, ContextSize.height * 0.01,),
        activeColor: AppColors.gold,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(27.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: AppColors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }

  PageViewModel buildPageViewModel({
    required String assetName,
    required String firstText,
    String secondText = "",
    bool isFirst = false
  }) {

    return PageViewModel(
      title: "",
      bodyWidget: Column(
        spacing: ContextSize.height * 0.02,
        children: [
          if(isFirst)SizedBox(height: ContextSize.height * 0.04,),
          Image.asset(assetName, width: double.infinity),
          if(isFirst)SizedBox(height: ContextSize.height * 0.04,),
          Text(firstText, style: AppStyles.gold24Bold),
          Text(secondText, style: AppStyles.gold20Bold, textAlign: .center),
        ],
      ),
      decoration: PageDecoration(
        bodyPadding: EdgeInsets.only(top: ContextSize.height * 0.18,),
      ),
    );
  }
}
