import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../core/routes/app_routes_name.dart';
import '../../../core/theme/app_color/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutesName.layout,
        (route) => false,
      );
    });
    super.initState();
  }

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
