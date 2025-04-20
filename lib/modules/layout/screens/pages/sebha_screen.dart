import 'package:flutter/material.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  double angle = 0;
  int counter = 0;
  int index = 0;

  List<String> azkar = ['سبحان الله', 'الحمد لله', 'الله أكبر'];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/sebha_bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Image.asset("assets/logos/home_logo.png"),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Stack(
              children: [
                Column(
                  children: [
                    Image.asset("assets/images/seb7a_head.png"),
                    Transform.rotate(
                      angle: angle,
                      child: Image.asset("assets/images/sebha_body.png"),
                    ),
                  ],
                ),
                Positioned.fill(
                  top: 100,
                  child: GestureDetector(
                    onTap: () => _onclick(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          azkar[index],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                          ),
                        ),
                        Text(
                          "$counter",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                          ),
                        ),
                      ],
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

  void _onclick() {
    angle += 270;
    counter++;
    if (counter == 34) {
      counter = 0;
      if (index == azkar.length - 1) {
        index = 0;
      }
      index++;
    }
    setState(() {});
  }
}
