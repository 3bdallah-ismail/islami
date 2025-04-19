import 'package:flutter/material.dart';

import '../../../../core/models/sura_data.dart';
import '../../../../core/routes/app_routes_name.dart';
import '../../../../core/theme/app_color/app_colors.dart';

class MostRecentlyWidget extends StatelessWidget {
  final SuraData data;

  const MostRecentlyWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutesName.quranDetails,
          arguments: data,
        );
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.gold,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                  data.nameEn,
                ),
                Text(
                  data.nameAr,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ),
                Text(
                  "${data.verses} Verses",
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
            Image.asset("assets/images/quranSura.png", width: 150),
          ],
        ),
      ),
    );
  }
}
