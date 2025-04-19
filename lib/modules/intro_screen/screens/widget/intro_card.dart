import 'package:flutter/material.dart';

import 'intro_data.dart';

class IntroCard extends StatelessWidget {
  const IntroCard({super.key, required this.introData});
  final IntroData introData;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Image.asset(introData.image),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            introData.text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            textAlign: TextAlign.center,
            introData.subtext,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Spacer(),
      ],
    );
  }
}
