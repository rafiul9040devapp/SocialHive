import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:infinity_list_comments/di/service_locator.dart';
import 'package:infinity_list_comments/route/app_routes.dart';
import 'package:infinity_list_comments/utils/simple_bloc_observer.dart';
import 'app.dart';

void main() async {
  Bloc.observer= const SimpleBlocObserver();
  ServiceLocator.setUp();
  AppRoutes.setupRouter();
  runApp(const MyApp());
}
