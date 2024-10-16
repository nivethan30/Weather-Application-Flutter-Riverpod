import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    textTheme: ThemeData.light().textTheme.apply(fontFamily: 'Poppins'),
    primaryColor: Colors.lightBlue,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.lightBlue,
      primary: const Color.fromARGB(255, 33, 142, 193),
      secondary: Colors.blue.shade200,
    ),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    textTheme: ThemeData.dark().textTheme.apply(fontFamily: 'Poppins'),
    primaryColor: const Color.fromARGB(255, 13, 37, 63),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.lightBlue,
      primary: const Color.fromARGB(255, 13, 37, 63),
      secondary: Colors.lightBlue.shade200.withOpacity(0.2),
    ),
  );
}
