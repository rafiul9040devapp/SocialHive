import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GetIt.instance<GoRouter>();
    return  MaterialApp.router(
      title: 'Comment App',
      debugShowCheckedModeBanner: false,
      routerConfig: router,

    );
  }
}
