import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:infinity_list_comments/di/service_locator.dart';
import 'package:infinity_list_comments/simple_bloc_observer.dart';
import 'app.dart';

void main() {
  Bloc.observer= const SimpleBlocObserver();
  ServiceLocator.setUp();
  runApp(const MyApp());
}
