import 'package:flutter/material.dart';

import 'app_colors.dart';

ThemeData lightMode = ThemeData(
  colorScheme: const ColorScheme.light(
    surface: AppColors.concrete,
    primary: AppColors.boulder,
    secondary: AppColors.alabaster,
    tertiary: AppColors.white,
    inversePrimary: AppColors.white,
  ),
  scaffoldBackgroundColor: AppColors.alabaster,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.concrete,
    iconTheme: IconThemeData(color: AppColors.mineShaft),
  ),
);
