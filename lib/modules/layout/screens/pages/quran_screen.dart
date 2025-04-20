import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constant/quran_help.dart';
import '../../../../core/models/sura_data.dart';
import '../../../../core/theme/app_color/app_colors.dart';
import '../widgets/most_recently_widget.dart';
import '../widgets/sura_card_widget.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  List<SuraData> mostRecently = [];
  List<SuraData> searchData = [];
  List<String> mostRecentlyIds = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/quran_bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.black.withValues(alpha: 0.7), AppColors.black],
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset("assets/logos/home_logo.png")),
              TextFormField(
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
                onChanged: (value) {
                  search(value);
                },
                decoration: InputDecoration(
                  hintText: "Sura Name",
                  hintStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                  prefixIcon: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: SvgPicture.asset(
                      "assets/icons/quran.svg",
                      color: AppColors.gold,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: AppColors.gold),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: AppColors.gold),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: AppColors.gold),
                  ),
                ),
              ),
              if (mostRecently.isNotEmpty)
                const Text(
                  "Most Recently ",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              if (mostRecently.isNotEmpty)
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    itemCount: mostRecently.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return MostRecentlyWidget(
                        data: SuraData(
                          number: mostRecently[index].number,
                          nameEn: mostRecently[index].nameEn,
                          nameAr: mostRecently[index].nameAr,
                          verses: mostRecently[index].verses,
                        ),
                      );
                    },
                  ),
                ),

              searchData.isEmpty
                  ? Expanded(
                    child: ListView.separated(
                      itemCount: 114,
                      itemBuilder: (context, index) {
                        return SuraCardWidget(
                          onTap: saveSura,
                          suraData: SuraData(
                            number: (index + 1).toString(),
                            nameEn: QuranHelper.quranSuraEn[index],
                            nameAr: QuranHelper.quranSuraAr[index],
                            verses: QuranHelper.ayaNumber[index],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(endIndent: 50, indent: 50);
                      },
                    ),
                  )
                  : Expanded(
                    child: ListView.separated(
                      itemCount: searchData.length,
                      itemBuilder: (context, index) {
                        return SuraCardWidget(
                          onTap: saveSura,
                          suraData: SuraData(
                            number: searchData[index].number,
                            nameEn: searchData[index].nameEn,
                            nameAr: searchData[index].nameAr,
                            verses: searchData[index].verses,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(endIndent: 50, indent: 50);
                      },
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }

  void saveSura(SuraData data) {
    mostRecently.insert(0, data);
    mostRecently = mostRecently.toSet().toList();
    saveLocalData((int.parse(data.number) - 1).toString());
    setState(() {});
  }

  Future<void> saveLocalData(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    mostRecentlyIds.insert(0, id);
    await prefs.setStringList("most", mostRecentlyIds);
  }

  Future<void> getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    mostRecentlyIds = prefs.getStringList("most") ?? [];
    for (String id in mostRecentlyIds) {
      int index = int.parse(id);
      mostRecently.add(
        SuraData(
          number: (index + 1).toString(),
          nameEn: QuranHelper.quranSuraEn[index],
          nameAr: QuranHelper.quranSuraAr[index],
          verses: QuranHelper.ayaNumber[index],
        ),
      );
    }
    setState(() {});
  }

  void search(String value) {
    searchData = [];
    QuranHelper.quranSuraEn.where((element) {
      if (element.toLowerCase().startsWith(value.toLowerCase())) {
        int index = QuranHelper.quranSuraEn.indexOf(element);
        searchData.add(
          SuraData(
            number: (index + 1).toString(),
            nameEn: QuranHelper.quranSuraEn[index],
            nameAr: QuranHelper.quranSuraAr[index],
            verses: QuranHelper.ayaNumber[index],
          ),
        );
      }
      return true;
    }).toList();
    QuranHelper.quranSuraAr.where((element) {
      if (element.toLowerCase().startsWith(value.toLowerCase())) {
        int index = QuranHelper.quranSuraAr.indexOf(element);
        searchData.add(
          SuraData(
            number: (index + 1).toString(),
            nameEn: QuranHelper.quranSuraEn[index],
            nameAr: QuranHelper.quranSuraAr[index],
            verses: QuranHelper.ayaNumber[index],
          ),
        );
      }
      return true;
    }).toList();
    setState(() {});
  }
}
