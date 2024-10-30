import 'package:flutter/material.dart';

import '../../../post/models/post.dart';

class PostDetails extends StatelessWidget {
  final Post post;
  const PostDetails({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: CircleAvatar(
                backgroundColor: colorScheme.tertiary,
                radius: 30,
                child: Text(
                  post.id.toString(),
                  style: textTheme.titleLarge?.copyWith(color: Colors.black,fontSize: 32),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            const SizedBox(height: 16),

            Text(
              post.title ?? '',
              style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 32
              ),
            ),

            const SizedBox(height: 8),

            Text(
              post.body ?? '',
              style: textTheme.titleMedium?.copyWith(fontSize: 18),
            ),

            const SizedBox(height: 48),

          ],
        ),
      ),
    );
  }
}
