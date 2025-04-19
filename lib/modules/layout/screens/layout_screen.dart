import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:islami/modules/layout/screens/pages/hadith_screen.dart';
import 'package:islami/modules/layout/screens/pages/quran_screen.dart';
import 'package:islami/modules/layout/screens/pages/radio_screen.dart';
import 'package:islami/modules/layout/screens/pages/sebha_screen.dart';
import 'package:islami/modules/layout/screens/pages/time_screen.dart';
import '../../../core/theme/app_color/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int selectedIndex = 0;
  List<Widget> screens = [
    const QuranScreen(),
    const HadithScreen(),
    const SebhaScreen(),
    const RadioScreen(),
    const TimeScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (value) {
          selectedIndex = value;
          setState(() {});
        },
        backgroundColor: AppColors.gold,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.white,
        unselectedItemColor: AppColors.black,
        showUnselectedLabels: false,
        selectedFontSize: 20,
        items: [
          customBtnItem(image: "quran.svg", title: "Quran"),
          customBtnItem(image: "hadith.svg", title: "Hadith"),
          customBtnItem(image: "sebha.svg", title: "Sebha"),
          customBtnItem(image: "radio.svg", title: "Radio"),
          customBtnItem(image: "time.svg", title: "Time"),
        ],
      ),
    );
  }

  BottomNavigationBarItem customBtnItem({
    required String image,
    required String title,
  }) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        "assets/icons/$image",
        colorFilter: const ColorFilter.mode(AppColors.black, BlendMode.srcIn),
        width: 30,
        height: 30,
      ),
      label: title,
      activeIcon: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: AppColors.black.withValues(alpha: 0.6),
        ),
        child: BounceIn(
          child: SvgPicture.asset(
            "assets/icons/$image",
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}
