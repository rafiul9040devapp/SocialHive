import 'package:flutter/material.dart';
import 'package:infinity_list_comments/features/post_of_user/model/posts_of_user.dart';

class PostOfUserItem extends StatelessWidget {
  final List<PostsOfUser> posts;
  const PostOfUserItem({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Center(
      child: ListWheelScrollView(
        itemExtent: 250, // Height of each item in the wheel
        diameterRatio: 1.5, // Curve intensity
        perspective: 0.004, // 3D perspective effect
        physics: const FixedExtentScrollPhysics(),
        offAxisFraction: -1.5,
        children: List.generate(posts.length, (index) {
          final post = posts[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            color: theme.tertiary,
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  post.body ?? '',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
