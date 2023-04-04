import 'package:flutter/material.dart';

abstract class AppColors {
  static MaterialColor primaryColor = const MaterialColor(0xFFA3EFB7, {
    50: Color(0xFFFBFFFC),
    100: Color(0xFFF6FEF8),
    200: Color(0xFFE8FBED),
    300: Color(0xFFDAF9E2),
    400: Color(0xFFBFF4CD),
    500: Color(0xFFA3EFB7),
    600: Color(0xFF92D5A3),
    700: Color(0xFF62906E),
    800: Color(0xFF4A6C53),
    900: Color(0xFF304636),
  });

  static MaterialColor secondaryColor = const MaterialColor(0xFFEFEFEF, {
    50: Color(0xFFFFFFFF),
    100: Color(0xFFFEFEFE),
    200: Color(0xFFFBFBFB),
    300: Color(0xFFF9F9F9),
    400: Color(0xFFF4F4F4),
    500: Color(0xFFEFEFEF),
    600: Color(0xFFD5D5D5),
    700: Color(0xFF909090),
    800: Color(0xFF6C6C6C),
    900: Color(0xFF464646),
  });

  static Color bgColor = const Color(0xFFF2F5F7);

  static Color mutedColor = const Color(0xFF6c757d);
}
