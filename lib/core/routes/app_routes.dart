import 'package:flutter/material.dart';
import 'package:islami/modules/intro_screen/screens/pages/intro_screen.dart';

import '../../modules/hadeth_details/screens/hadeth_details_screen.dart';
import '../../modules/layout/screens/layout_screen.dart';
import '../../modules/quran_details/screens/quran_details_screen.dart';
import '../../modules/splash/screens/splash_screen.dart';
import 'app_routes_name.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    AppRoutesName.splash: (_) => const SplashScreen(),
    AppRoutesName.layout: (_) => const LayoutScreen(),
    AppRoutesName.quranDetails: (_) => const QuranDetailsScreen(),
    AppRoutesName.intro: (_) => const IntroScreen(),
    AppRoutesName.hadethDetails: (_) => HadethDetailsScreen(),
  };
}
