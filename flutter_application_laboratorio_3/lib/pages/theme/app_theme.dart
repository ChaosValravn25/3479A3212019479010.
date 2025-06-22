import 'package:flutter/material.dart';
import 'color_schemes.g.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: lightColorScheme,
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: 'Lato',
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: darkColorScheme,
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: 'Lato',
  );
}
