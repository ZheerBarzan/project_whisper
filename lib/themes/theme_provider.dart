import 'package:flutter/material.dart';
import 'package:project_whisper/themes/dark_theme.dart';
import 'package:project_whisper/themes/light_theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode;

  // to get the theme
  ThemeData get themeData => _themeData;
  // cheking if the it is dark mode
  bool get isDarkMode => _themeData == darkMode;
  // setiing the theme
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

// toggle modes
  void toggleThemeMode() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
