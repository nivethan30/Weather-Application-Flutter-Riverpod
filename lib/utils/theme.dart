import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    textTheme: ThemeData.light().textTheme.apply(fontFamily: 'Poppins'),
    primaryColor: Colors.lightBlue,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.lightBlue,
      primary: Colors.lightBlue.shade400,
      secondary: Colors.blue.shade200,
    ),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    textTheme: ThemeData.dark().textTheme.apply(fontFamily: 'Poppins'),
    primaryColor: Colors.indigo,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.lightBlue,
      primary: Colors.indigo.shade900,
      secondary: Colors.lightBlue.shade200.withOpacity(0.2),
    ),
  );
}
