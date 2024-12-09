import 'package:flutter/material.dart';

class MyColors {
  static Color white = Colors.white;
  static Color accent = Colors.blueAccent;
  static Color text = Colors.black;
  static Color lightText = Colors.black87;
}

class Themes {
  static ThemeData defaultTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: MyColors.accent,
    colorScheme: ColorScheme.light(
      brightness: Brightness.light,
      primary: MyColors.accent,
      secondary: MyColors.accent,
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: MyColors.accent,
      titleTextStyle: TextStyle(
          color: MyColors.white,
          fontSize: 24
        ),
    ),
  );
}

class MyTextStyles {
  static TextStyle heading1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: MyColors.text,

  );

  static TextStyle heading2 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: MyColors.text,

  );

  static TextStyle heading3 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: MyColors.lightText,

  );

  static TextStyle heading4 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: MyColors.lightText,

  );
}


