import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends ChangeNotifier {
  static const String prefKey = "isDarkMode";

  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;

  ThemeNotifier() {
    _loadFromPrefs();
  }

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    _saveToPrefs();
    notifyListeners();
  }

  void _loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool(prefKey) ?? false;
    notifyListeners();
  }

  void _saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(prefKey, _isDarkMode);
  }
}
