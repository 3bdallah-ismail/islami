import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../../../core/theme/app_color/app_colors.dart';

class SecondSplashScreen extends StatefulWidget {
  const SecondSplashScreen({super.key});

  @override
  State<SecondSplashScreen> createState() => _SecondSplashScreenState();
}

class _SecondSplashScreenState extends State<SecondSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ZoomIn(
                duration: const Duration(seconds: 1),
                child: const Center(
                  child: Image(image: AssetImage("assets/logos/logo.png")),
                ),
              ),
            ),

            FadeInUp(
              delay: const Duration(seconds: 1),
              child: Image.asset("assets/logos/logo_route.png"),
            ),
          ],
        ),
      ),
    );
  }
}
