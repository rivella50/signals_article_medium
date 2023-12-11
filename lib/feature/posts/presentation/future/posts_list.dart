import 'package:flutter/material.dart';
import 'package:signals_article/feature/posts/domain/post.dart';
import 'package:signals_article/feature/posts/presentation/future/post_widget.dart';

class PostsList extends StatelessWidget {
  PostsList({
    super.key,
    required this.posts,
  });

  List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return PostWidget(
          post: posts[index],
        );
      },
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        height: 10,
      ),
      itemCount: posts.length,
    );
  }
}
