import 'package:flutter/material.dart';
import '../../models/comments_of_post.dart';

class CommentsOfPostItem extends StatelessWidget {
  final List<CommentsOfPost> commentsOfPost;

  const CommentsOfPostItem({super.key, required this.commentsOfPost});

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
        children: List.generate(commentsOfPost.length, (index) {
          final comment = commentsOfPost[index];
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
                  comment.body ?? '',
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
