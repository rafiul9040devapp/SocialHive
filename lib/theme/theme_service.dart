import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

ThemeService get themeService => GetIt.instance<ThemeService>();

class ThemeService {
  final BuildContext context;

  ThemeService(this.context);

  double get screenWidth => MediaQuery.of(context).size.width;

  double get screenHeight => MediaQuery.of(context).size.height;

  TextTheme get textTheme => Theme.of(context).textTheme;

  EdgeInsets get padding => const EdgeInsets.all(16.0);

  Brightness get brightness => Theme.of(context).brightness;

  static void setUpThemeService(BuildContext context) {
    if (!GetIt.instance.isRegistered<ThemeService>()) {
      GetIt.instance.registerFactory(() => ThemeService(context));
    }
  }

// static void setUpThemeService(BuildContext context) =>   getIt.registerFactory(() => ThemeService(context));
}
