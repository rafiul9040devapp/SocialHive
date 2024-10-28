import 'package:flutter/material.dart';

import '../../../../route/app_routes.dart';
import '../../../../theme/theme_service.dart';

class CommentDetailsAppBar extends StatelessWidget {
  const CommentDetailsAppBar({super.key});
  @override
  Widget build(BuildContext context) {

    return AppBar(
      title: Text('Details'.toUpperCase(),style: themeService.textTheme.titleLarge?.copyWith(
        letterSpacing: 5,
      ),overflow: TextOverflow.fade,),
      centerTitle: true,
      leading: GestureDetector(onTap: _navigateToCommentScreen, child: const Icon(Icons.arrow_back_ios)),
    );
  }

  void _navigateToCommentScreen() => router.go(Routes.comment.path());
}
