import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/theme/app_color/app_colors.dart';
import '../../layout/screens/pages/hadith_screen.dart';

class HadethDetailsScreen extends StatelessWidget {
  HadethDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HadethData hadeth =
        ModalRoute.of(context)!.settings.arguments as HadethData;
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: Text(hadeth.title),
        titleTextStyle: const TextStyle(color: AppColors.gold, fontSize: 24),
        iconTheme: const IconThemeData(color: AppColors.gold),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Hero(tag: "bg", child: Image.asset("assets/images/bg_hadeth.png")),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  textDirection: TextDirection.ltr,
                  children: [
                    Image.asset("assets/images/left.png"),
                    Expanded(
                      child: Center(
                        child: Text(
                          hadeth.title,
                          style: const TextStyle(
                            color: AppColors.gold,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                    Image.asset("assets/images/right.png"),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      hadeth.body,
                      style: const TextStyle(
                        color: AppColors.gold,
                        fontSize: 24,
                      ),
                      textAlign: TextAlign.center,
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
