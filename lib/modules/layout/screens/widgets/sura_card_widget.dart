import 'package:flutter/material.dart';

import '../../../../core/models/sura_data.dart';
import '../../../../core/routes/app_routes_name.dart';

class SuraCardWidget extends StatelessWidget {
  final SuraData suraData;
  final void Function(SuraData) onTap;

  const SuraCardWidget({
    super.key,
    required this.suraData,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(suraData);
        Navigator.pushNamed(
          context,
          AppRoutesName.quranDetails,
          arguments: suraData,
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              width: 70,
              height: 70,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/sura.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    suraData.number,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(flex: 1),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  suraData.nameEn,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "${suraData.verses}  Verses  ",
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
            const Spacer(flex: 4),
            Text(
              suraData.nameAr,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
