import 'package:flutter/material.dart';
import 'package:signals_article/feature/posts/domain/post.dart';
import 'package:signals_article/utils/decorated_container.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    return DecoratedContainer(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Id: ${post.id}',
            ),
            Text(
              'Title: ${post.title}',
            ),
          ],
        ),
      ),
    );
  }
}
