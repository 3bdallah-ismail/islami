import 'package:flutter/material.dart';

import 'intro_data.dart';

class IntroCard extends StatelessWidget {
  const IntroCard({super.key, required this.introData});

  final IntroData introData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(introData.image),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            introData.text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            textAlign: TextAlign.center,
            introData.subtext,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
