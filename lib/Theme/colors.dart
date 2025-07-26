import 'package:flutter/material.dart';

Color kMainColor = const Color(0xff5b4729);
Color k2MainColor = const Color(0xFF89825a);

class Constants {
  static String appName = "Webingo Demo";

  //Colors for theme
  static Color lightPrimary = const Color(0xfffcfcff);
  static Color darkPrimary = Colors.black;
  static Color? lightAccent = kMainColor;
  static Color darkAccent = Colors.white;
  static Color lightBG = Colors.grey.shade200;
  static Color darkBG = Colors.black;

  static ThemeData lightTheme = ThemeData(
    primaryColor: lightPrimary,
    hintColor: lightAccent,
    scaffoldBackgroundColor: lightBG,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontSize: 16, color: Colors.black, fontFamily: 'Barlow'),
    ),
    appBarTheme: AppBarTheme(
      foregroundColor: Colors.black,
      backgroundColor: lightBG,
      elevation: 0,
      toolbarTextStyle: TextTheme(
        titleLarge: TextStyle(
            color: darkBG,
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            fontFamily: 'Barlow'
        ),
      ).bodyMedium,
      titleTextStyle: TextTheme(
        titleLarge: TextStyle(
            color: darkBG,
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            fontFamily: 'Barlow'
        ),
      ).titleLarge,
    ),
    useMaterial3: true,
  );
}
