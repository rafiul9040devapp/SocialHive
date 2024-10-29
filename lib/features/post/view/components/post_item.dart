import 'package:flutter/material.dart';
import 'package:infinity_list_comments/features/post/models/post.dart';

import '../../../../route/app_routes.dart';
import '../../../../theme/theme_service.dart';

class PostItem extends StatelessWidget {
  final Post post;
  const PostItem({super.key, required this.post});

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap:() => _navigateToPostDetailsPage(post),
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
                post.title ?? '',
                style: themeService.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                post.body ?? '',
                style: themeService.textTheme.bodyMedium,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: 8),
              const ShowAllComments(),
            ],
          ),
        ),
      ),
    );
  }



  void _navigateToPostDetailsPage(Post post) {
   router.go(Routes.postDetails.path(post.id.toString()),extra: post);
  }
}

class ShowAllComments extends StatelessWidget {
  const ShowAllComments({super.key});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigateToUserDetails(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Text(
                  'comments',
                  style: themeService.textTheme.titleSmall?.copyWith(
                    color: Colors.lightBlueAccent[100],
                    fontSize: 18,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.end,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: 2, // Thickness of the underline
                    width: 85, // Width of the underline
                    color: Colors.redAccent[100], // Custom underline color
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

  }

  _navigateToUserDetails() {
    //router.push(Routes.user.path(album.postId.toString()),extra: album.email);
  }
}
