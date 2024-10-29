import 'package:flutter/material.dart';

import '../../../../theme/theme_service.dart';

class PostAppBar extends StatelessWidget {
  const PostAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Posts'.toUpperCase(),style: themeService.textTheme.titleLarge?.copyWith(
        letterSpacing: 5,
      ),overflow: TextOverflow.fade,),
      centerTitle: true,
    );
  }
}
