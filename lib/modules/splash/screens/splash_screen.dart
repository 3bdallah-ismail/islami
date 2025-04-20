import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/routes/app_routes_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkFirstTime();
  }

  Future<void> checkFirstTime() async {
    await Future.delayed(const Duration(seconds: 3)); // مدة عرض السبلاتش

    final prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('isFirstTime') ?? true;

    if (isFirstTime) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutesName.intro,
        (route) => false,
      );
    } else {
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutesName.layout,
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/logos/splash_bg.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SafeArea(
                    child: ZoomIn(
                      duration: Duration(seconds: 1),
                      child: Image.asset("assets/logos/splash_logo.png"),
                    ),
                  ),
                  FadeInDown(
                    duration: Duration(seconds: 1),
                    child: Image.asset("assets/logos/Glow.png"),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: SlideInLeft(
                  delay: Duration(seconds: 2),
                  child: Image.asset("assets/logos/left.png"),
                ),
              ),
              Expanded(
                child: ZoomIn(
                  duration: Duration(seconds: 1),
                  child: SizedBox(
                    width: 100,
                    child: Image.asset(
                      "assets/logos/logo.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SlideInRight(
                  delay: Duration(seconds: 2),
                  child: Image.asset("assets/logos/right.png"),
                ),
              ),
              ElasticIn(
                child: ElasticIn(
                  delay: Duration(seconds: 2),
                  child: Image(
                    image: AssetImage("assets/logos/logo_route.png"),
                    width: 300,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
