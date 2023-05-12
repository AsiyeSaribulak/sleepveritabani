import 'package:flutter/material.dart';

class CustomColors {
  static Color primaryTextColor = Colors.white;
  static Color dividerColor = Colors.white54;
  static Color pageBackgroundColor = const Color(0xFF2D2F41);
  static Color menuBackgroundColor = const Color(0xFF242634);

  static Color clockBG = const Color(0xFF444974);
  static Color clockOutline = const Color(0xFFEAECFF);
  static Color? secHandColor = Colors.orange[300];
  static Color minHandStatColor = const Color(0xFF748EF6);
  static Color minHandEndColor = const Color(0xFF77DDFF);
  static Color hourHandStatColor = const Color(0xFFC279FB);
  static Color hourHandEndColor = const Color(0xFFEA74AB);

  static Color darkBckground = Color.fromARGB(252, 6, 9, 32);
  static Color background = const Color.fromARGB(253, 14, 18, 49);
  static Color nightBackground = const Color.fromARGB(255, 205, 207, 218);
  static Color greenBackground = const Color.fromARGB(255, 97, 190, 145);
  static Color purpleBackground = const Color.fromARGB(255, 108, 75, 211);
  static Color orangeBackground = const Color.fromARGB(255, 232, 115, 54);
  static Color blueBackground = const Color.fromARGB(255, 0, 156, 238);
  static Color kremBackground = const Color.fromARGB(255, 232, 203, 149);
  static Color purple2Background = const Color.fromARGB(255, 87, 68, 194);
  static Color pinkBackground = const Color.fromARGB(255, 240, 99, 168);
  static Color mintBackground = const Color.fromARGB(255, 0, 118, 147);
  static Color tahtaBackground = const Color.fromARGB(255, 180, 136, 86);
}

class GradientColors {
  final List<Color> colors;
  GradientColors(this.colors);

  static List<Color> sky = [const Color(0xFF6448FE), const Color(0xFF5FC6FF)];
  static List<Color> sunset = [
    const Color(0xFFFE6197),
    const Color(0xFFFFB463)
  ];
  static List<Color> sea = [const Color(0xFF61A3FE), const Color(0xFF63FFD5)];
  static List<Color> mango = [const Color(0xFFFFA738), const Color(0xFFFFE130)];
  static List<Color> fire = [const Color(0xFFFF5DCD), const Color(0xFFFF8484)];
}

class GradientTemplate {
  static List<GradientColors> gradientTemplate = [
    GradientColors(GradientColors.sky),
    GradientColors(GradientColors.sunset),
    GradientColors(GradientColors.sea),
    GradientColors(GradientColors.mango),
    GradientColors(GradientColors.fire),
  ];
}
