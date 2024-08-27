import 'package:flutter/material.dart';
import 'package:infinity_list_comments/features/comment/models/album.dart';
import 'package:infinity_list_comments/route/app_routes.dart';

class CommentDetailsPage extends StatelessWidget {
  final Album album;

  const CommentDetailsPage({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () => router.go(Routes.comment.path()),
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(album.email),
            ],
          ),
        ),
      ),
    );
  }
}
