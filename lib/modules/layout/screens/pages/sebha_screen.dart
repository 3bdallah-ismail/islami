import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_color/app_colors.dart';

class SebhaScreen extends StatelessWidget {
  const SebhaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/sebha_bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Image.asset("assets/logos/home_logo.png"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
                style: TextStyle(
                  color: AppColors.gold,
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
