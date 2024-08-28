import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:infinity_list_comments/theme/light_mode.dart';
import 'package:infinity_list_comments/theme/theme_service.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GetIt.instance<GoRouter>();
    ThemeService.setUpThemeService(context);
    return  MaterialApp.router(
      title: 'Comment App',
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: lightMode,
      darkTheme: lightMode,
    );
  }
}
