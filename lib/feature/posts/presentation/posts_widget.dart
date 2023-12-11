import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:signals_article/feature/posts/presentation/posts_controller.dart';
import 'package:signals_article/feature/posts/presentation/posts_list.dart';
import 'package:signals_article/main.dart';
import 'package:signals_article/utils/async_value.dart';

class PostsWidget extends StatelessWidget {
  const PostsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(45),
              ),
              onPressed:
                  getIt.get<PostsController>().postsSignal.value is AsyncLoading
                      ? null
                      : () => getIt.get<PostsController>().getPosts(),
              child: const Text('Load Posts')),
          const SizedBox(height: 20,),
          switch (getIt.get<PostsController>().postsSignal.watch(context)) {
            AsyncData<dynamic>(value: final list) => PostsList(
                posts: list,
              ),
            AsyncError(error: final e) => Text(
              e.toString(),
            ),
            _ => const CircularProgressIndicator(),
          }
        ],
      ),
    );
  }
}
