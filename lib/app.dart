import 'package:flutter/material.dart';
import 'package:infinity_list_comments/comment/view/comment_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Comment App',
      debugShowCheckedModeBanner: false,
      home: CommentPage(),
    );
  }
}
