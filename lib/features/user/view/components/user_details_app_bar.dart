import 'package:flutter/material.dart';
import 'package:infinity_list_comments/route/app_routes.dart';
import '../../../../theme/theme_service.dart';

class UserDetailsAppBar extends StatelessWidget {
  const UserDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'User Details'.toUpperCase(),
        style: themeService.textTheme.titleLarge?.copyWith(
          letterSpacing: 5,
        ),
        overflow: TextOverflow.fade,
      ),
      centerTitle: true,
      leading: GestureDetector(
          onTap: () => _navigateToCommentDetailsScreen(),
          child: const Icon(Icons.arrow_back_ios)),
    );
  }

  void _navigateToCommentDetailsScreen() => router.pop();
}
