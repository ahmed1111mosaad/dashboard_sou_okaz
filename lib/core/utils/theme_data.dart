import 'package:dashbaord_sou_okaz/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.dark),
  colorScheme: ColorScheme.light(
    surface: Color(0xFFF5F5F5),
    onSurface: Colors.black,
    secondary: Colors.white,
    error: Colors.red,
    surfaceContainer: Colors.black.withAlpha(170),
    surfaceBright: Colors.black,
  ),

  fontFamily: 'Airbnb Cereal App',
  primaryColor: Color(0xFF5B9EE1),
  textTheme: TextTheme(
    labelSmall: TextStyle(color: const Color.fromARGB(255, 244, 99, 89)),
    // title
    bodyLarge: AppTextStyles.medium28,
    titleLarge: AppTextStyles.medium40,
    titleMedium: AppTextStyles.medium16,
    bodyMedium: AppTextStyles.medium18.copyWith(color: Color(0xff1A2530)),
    // sign up for free
    bodySmall: AppTextStyles.medium14,
  ),
  iconTheme: IconThemeData(color: Color(0xFFC0E0FF)),
  primaryIconTheme: IconThemeData(color: Color.fromARGB(255, 238, 237, 237)),
);

// ToDO DarkMode
ThemeData darkMode = ThemeData(
  appBarTheme: AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.dark),
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Color(0xFF1a2530),
    onSurface: Colors.white,
    secondary: Color(0xFF161F28),
    error: Colors.orange,
    surfaceContainer: Colors.white,
    surfaceBright: Color.fromARGB(255, 255, 195, 121),
  ),
  fontFamily: 'Airbnb Cereal App',
  primaryColor: Color(0xFF5B9EE1),
  textTheme: TextTheme(
    titleLarge: AppTextStyles.medium40.copyWith(color: Colors.white),
    titleMedium: AppTextStyles.medium18.copyWith(color: Colors.white),
    bodyMedium: AppTextStyles.medium18.copyWith(color: Colors.white),
    // title
    bodyLarge: AppTextStyles.medium28.copyWith(color: Colors.white),
    // sign up for free
    bodySmall: AppTextStyles.medium14.copyWith(color: Colors.white),
  ),
  iconTheme: IconThemeData(color: Color.fromARGB(255, 16, 24, 32)),

  // Nike
  primaryIconTheme: IconThemeData(color: Color(0xFF161F28)),
);
