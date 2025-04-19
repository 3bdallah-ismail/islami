import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/models/sura_data.dart';
import '../../../core/theme/app_color/app_colors.dart';

class QuranDetailsScreen extends StatefulWidget {
  const QuranDetailsScreen({super.key});

  @override
  State<QuranDetailsScreen> createState() => _QuranDetailsScreenState();
}

class _QuranDetailsScreenState extends State<QuranDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    SuraData suraData = ModalRoute.of(context)!.settings.arguments as SuraData;
    if (verses.isEmpty) {
      readFile(suraData.number);
    }
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        title: Center(child: Text(suraData.nameEn)),
        titleTextStyle: const TextStyle(color: AppColors.gold, fontSize: 30),
        iconTheme: const IconThemeData(color: AppColors.gold, size: 36),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              textDirection: TextDirection.ltr,
              children: [
                Image.asset("assets/images/left.png"),
                Expanded(
                  child: Center(
                    child: Text(
                      suraData.nameAr,
                      style: const TextStyle(
                        color: AppColors.gold,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Image.asset("assets/images/right.png"),
              ],
            ),
            // Expanded(
            //   child:
            //       verses.isEmpty
            //           ? const Center(child: CircularProgressIndicator())
            //           : ListView.builder(
            //             itemCount: verses.length,
            //             itemBuilder: (context, index) {
            //               return Container(
            //                 padding: const EdgeInsets.all(8),
            //                 margin: const EdgeInsets.all(2),
            //                 decoration: BoxDecoration(
            //                   borderRadius: BorderRadius.circular(16),
            //                   border: Border.all(color: AppColors.gold),
            //                 ),
            //                 child: Text(
            //                   "[${index + 1}] ${verses[index]}",
            //                   textDirection: TextDirection.rtl,
            //                   textAlign: TextAlign.center,
            //                   style: const TextStyle(
            //                     color: AppColors.gold,
            //                     fontSize: 18,
            //                     fontWeight: FontWeight.bold,
            //                   ),
            //                 ),
            //               );
            //             },
            //           ),
            // ),
            Expanded(
              child: SingleChildScrollView(
                child: Text.rich(
                  textDirection: TextDirection.rtl,
                  TextSpan(
                    children:
                        verses.map((e) {
                          int index = verses.indexOf(e);
                          return TextSpan(
                            text: "$e [${index + 1}] ",
                            style: const TextStyle(
                              color: AppColors.gold,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void readFile(String id) async {
    String data = await rootBundle.loadString("assets/suras/$id.txt");
    data = data.trim();
    verses = data.split("\n");
    setState(() {});
  }
}
