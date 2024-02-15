import 'package:flutter/material.dart';

abstract class ThemeMangaer {
  static ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      foregroundColor: Colors.white,
      backgroundColor: Colors.amber,
      elevation: 5,
      shadowColor: Colors.green,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w600,
        color: Colors.black,
        fontStyle: FontStyle.italic,
      ),
      bodyMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: Colors.black38,
        fontStyle: FontStyle.normal,
      ),
    ),
  );
  static ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      foregroundColor: Colors.pink,
      backgroundColor: Colors.grey.shade400,
      elevation: 5,
      shadowColor: Colors.grey,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w600,
        color: Colors.white,
        fontStyle: FontStyle.italic,
      ),
      bodyMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: Colors.white38,
        fontStyle: FontStyle.normal,
      ),
    ),
  );
}
