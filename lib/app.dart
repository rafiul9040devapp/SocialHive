import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:infinity_list_comments/theme/light_mode.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GetIt.instance<GoRouter>();
    return  MaterialApp.router(
      title: 'Comment App',
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: lightMode,
      darkTheme: lightMode,
    );
  }
}
