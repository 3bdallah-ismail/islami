import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/routes/app_routes_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
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
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/splash/background.png"),
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
                      child: Image.asset("assets/splash/mosque.png"),
                    ),
                  ),
                  FadeInDown(
                    duration: Duration(seconds: 1),
                    child: Image.asset("assets/splash/Glow.png"),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: SlideInLeft(
                  delay: Duration(seconds: 2),
                  child: Image.asset("assets/splash/shape2.png"),
                ),
              ),
              Expanded(
                child: ZoomIn(
                  duration: Duration(seconds: 1),
                  child: SizedBox(
                    width: 100,
                    child: Image.asset(
                      "assets/splash/islami.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SlideInRight(
                  delay: Duration(seconds: 2),
                  child: Image.asset("assets/splash/shape1.png"),
                ),
              ),
              ElasticIn(
                child: ElasticIn(
                  delay: Duration(seconds: 2),
                  child: Image(
                    image: AssetImage("assets/splash/route_logo.png"),
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
