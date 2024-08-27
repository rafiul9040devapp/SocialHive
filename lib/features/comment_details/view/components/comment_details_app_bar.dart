import 'package:flutter/material.dart';

import '../../../../route/app_routes.dart';

class CommentDetailsAppBar extends StatelessWidget {
  const CommentDetailsAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return AppBar(
      //title: Text(name,style: textTheme.titleLarge,overflow: TextOverflow.fade,),
      leading: GestureDetector(onTap: _navigateToCommentScreen, child: const Icon(Icons.arrow_back_ios)),
    );
  }

  void _navigateToCommentScreen() => router.go(Routes.comment.path());
}
