import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:infinity_list_comments/di/service_locator.dart';
import 'package:infinity_list_comments/theme/theme_service.dart';

import '../../../../route/app_routes.dart';
import '../../models/album.dart';


class CommentItem extends StatelessWidget {
  const CommentItem({
    super.key,
    required this.album,
  });

  final Album album;

  @override
  Widget build(BuildContext context) {


     final theme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap:() => _navigateToCommentDetailsPage(album),
      child: Card(
        elevation: 3.0,
        color: theme.tertiary,
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                album.name,
                style: themeService.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              // const SizedBox(height: 4.0),
              // Text(
              //   album.email,
              //   style: textTheme.titleMedium?.copyWith(
              //         color: Colors.grey[600],
              //       ),
              // ),
              const SizedBox(height: 8.0),
              Text(
                album.body,
                style: themeService.textTheme.bodyMedium,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToCommentDetailsPage(Album album) {
    router.go(Routes.commentDetails.path(album.id.toString()),extra: album);
  }
}
