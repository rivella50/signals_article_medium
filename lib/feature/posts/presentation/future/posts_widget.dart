import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:signals_article/feature/posts/presentation/future/posts_future_controller.dart';
import 'package:signals_article/feature/posts/presentation/future/posts_list.dart';
import 'package:signals_article/main.dart';

class PostsWidget extends StatelessWidget {
  const PostsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = getIt.get<PostsFutureController>();
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(45),
              ),
              onPressed: controller.postsSignal.value
                      is AsyncLoading
                  ? null
                  : () => controller.getPosts(),
              child: const Text('Load Posts')),
          const SizedBox(
            height: 20,
          ),
          switch (controller.postsSignal.watch(context)) {
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
