import 'package:chat_bot/themes/dark_mode.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'light_mode.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;

  set themeData(ThemeData themeDate){
    _themeData = themeDate;
    notifyListeners();
  }

  void toggleTheme(){
    if (_themeData == lightMode){
      themeData = darkMode;
    }else {
      themeData = lightMode;
    }
  }
}