import 'package:flutter/material.dart';

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({ this.selectedColor = 0, this.isDarkMode = false});

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    colorSchemeSeed: Colors.blue,
    appBarTheme: const AppBarTheme(
      centerTitle: false
    ),
  );
}