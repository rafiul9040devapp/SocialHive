import 'package:flutter/material.dart';
import 'package:infinity_list_comments/features/comment/models/album.dart';

class CommentDetails extends StatelessWidget {
  final Album album;

  const CommentDetails({super.key, required this.album});

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
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: CircleAvatar(
                backgroundColor: colorScheme.tertiary,
                radius: 30,
                child: Text(
                  album.id.toString(),
                  style: textTheme.titleLarge?.copyWith(color: Colors.black,fontSize: 32),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            const SizedBox(height: 16),

            Text(
              album.name,
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 32
              ),
            ),

            const SizedBox(height: 8),

            Text(
              album.body,
              style: textTheme.titleMedium?.copyWith(fontSize: 18),
            ),

            const SizedBox(height: 48),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Text(
                    album.email,
                    style: textTheme.titleSmall?.copyWith(
                      color: Colors.grey[600],
                      fontSize: 18,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}
