import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:signals_article/feature/posts/presentation/posts_controller.dart';
import 'package:signals_article/feature/posts/presentation/future/posts_list.dart';
import 'package:signals_article/main.dart';

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
              onPressed: getIt.get<PostsController>().postsSignal.value
                      is AsyncSignalStateLoading
                  ? null
                  : () => getIt.get<PostsController>().getPosts(),
              child: const Text('Load Posts')),
          const SizedBox(
            height: 20,
          ),
          switch (getIt.get<PostsController>().postsSignal.watch(context)) {
            AsyncSignalStateData<dynamic>(value: final list) => PostsList(
                posts: list,
              ),
            AsyncSignalStateError(error: final e) => Text(
                e.toString(),
              ),
            _ => const CircularProgressIndicator(),
          }
        ],
      ),
    );
  }
}
