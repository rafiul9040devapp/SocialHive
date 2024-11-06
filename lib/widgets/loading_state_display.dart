import 'package:flutter/material.dart';

class LoadingStateDisplay extends StatelessWidget {
  const LoadingStateDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
