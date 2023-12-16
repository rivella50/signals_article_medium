import 'package:flutter/material.dart';
import 'package:signals_article/feature/posts/presentation/future/posts_widget.dart';

class FutureScreen extends StatelessWidget {
  const FutureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future'),
      ),
      body: const PostsWidget(),
    );
  }
}
