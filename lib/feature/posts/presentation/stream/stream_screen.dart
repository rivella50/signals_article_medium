import 'package:flutter/material.dart';
import 'package:signals_article/feature/posts/presentation/stream/posts_stream_widget.dart';

class StreamScreen extends StatelessWidget {
  const StreamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream'),
      ),
      body: const PostsStreamWidget(),
    );
  }
}
