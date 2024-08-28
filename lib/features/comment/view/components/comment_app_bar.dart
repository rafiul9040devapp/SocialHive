import 'package:flutter/material.dart';
import 'package:infinity_list_comments/theme/theme_service.dart';

class CommentAppBar extends StatelessWidget {
  const CommentAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Comments'.toUpperCase(),style: themeService.textTheme.titleLarge?.copyWith(
        letterSpacing: 5,
      ),overflow: TextOverflow.fade,),
      centerTitle: true,
    );
  }
}
