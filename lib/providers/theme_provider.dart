import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_provider_theme/config/di.dart';
import 'package:shared_provider_theme/utils/theme_manager.dart';

class ThemeProvider extends ChangeNotifier {
  late ThemeData themeData;
  late bool? isDarkMode;

  void changeTheme() {
    if (isDarkMode!) {
      themeData = ThemeMangaer.lightMode;
    } else {
      themeData = ThemeMangaer.darkMode;
    }
    isDarkMode = !isDarkMode!;
    getIt.get<SharedPreferences>().setBool('theme', isDarkMode!);
    notifyListeners();
  }

  void initTheme() {
    print('InitState');
    isDarkMode = getIt.get<SharedPreferences>().getBool('theme') ?? false;
    if (isDarkMode!) {
      themeData = ThemeMangaer.darkMode;
    } else {
      themeData = ThemeMangaer.lightMode;
    }
  }
}
