import 'package:flutter/material.dart';
import 'package:islami/modules/intro_screen/screens/widget/intro_card.dart';

import '../../../../core/routes/app_routes_name.dart';
import '../widget/intro_data.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int index = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: index);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Image.asset("assets/logos/home_logo.png"),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: introData.length,
                onPageChanged: (i) {
                  setState(() {
                    index = i;
                  });
                },
                itemBuilder: (context, index) {
                  return IntroCard(introData: introData[index]);
                },
              ),
            ),
            Row(
              children: [
                index == 0
                    ? const SizedBox()
                    : TextButton(
                      onPressed: () {
                        if (index > 0) {
                          _pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        }
                      },
                      child: const Text(
                        "Back",
                        style: TextStyle(color: Color(0xffFFD482)),
                      ),
                    ),
                const Spacer(),
                ...[0, 1, 2, 3, 4].map((e) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    height: 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color:
                          e == index
                              ? const Color(0xffFFD482)
                              : const Color(0xff707070),
                    ),
                    margin: const EdgeInsets.all(4),
                    width: e == index ? 30 : 10,
                  );
                }),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    if (index < 4) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    }
                    if (index == 4) {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRoutesName.layout,
                        (route) => false,
                      );
                    }
                  },
                  child: Text(
                    index == 4 ? "Finish" : "Next",
                    style: const TextStyle(
                      color: Color(0xffFFD482),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
