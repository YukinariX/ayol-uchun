import 'package:flutter/material.dart';

import 'colors.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    fontFamily: "OpenSans",
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: Colors.white,
      onPrimary: AppColors.redPinkMain,
      secondary: Colors.white,
      onSecondary: Colors.black,
      error: Colors.red,
      onError: AppColors.pinkSub,
      surface: Colors.white,
      onSurface: Colors.black,
    ),
    appBarTheme: AppBarTheme(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.white,
    ),
  );
}
