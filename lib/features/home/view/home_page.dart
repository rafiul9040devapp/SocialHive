import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_list_comments/di/service_locator.dart';
import 'package:infinity_list_comments/features/home/view/home_view.dart';

import '../bloc/navigation_bloc.dart';

class HomePage extends StatelessWidget {
  final int initialPage;
  const HomePage({super.key, required this.initialPage});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<NavigationBloc>(),
      child: HomeView(initialPage: initialPage),
    );
  }
}
