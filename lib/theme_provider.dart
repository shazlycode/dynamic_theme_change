import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  var _isDark = true;
  Future<bool> isDarkF;
  get isDark => _isDark;
  SharedPreferences pref;
  ThemeData _darkThemeData = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.amber,
    accentColor: Colors.amber,
  );

  get darkThemeData => _darkThemeData;

  toggleTheme(bool isD) {
    _isDark = !_isDark;
    _isDark = isD;
    _setThemePref();
    notifyListeners();
  }

  _setThemePref() async {
    pref = await SharedPreferences.getInstance();
    pref.setBool('theme', _isDark);
    notifyListeners();
  }

  getThemePref() async {
    pref = await SharedPreferences.getInstance();
    _isDark = pref.getBool('theme') == null ? false : pref.getBool('theme');

    notifyListeners();
  }

  ThemeData _lightThemeData = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
    accentColor: Colors.blue,
  );
  get lightThemeData => _lightThemeData;
}
