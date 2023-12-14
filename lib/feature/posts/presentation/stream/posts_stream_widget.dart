import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:signals_article/feature/posts/presentation/posts_controller.dart';
import 'package:signals_article/main.dart';

class PostsStreamWidget extends StatelessWidget {
  const PostsStreamWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = getIt.get<PostsController>();
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(45),
              ),
              onPressed: () => controller.startPostsStream(),
              child: const Text('Start Posts Stream')),
          const SizedBox(
            height: 20,
          ),
          Watch(
            (context) => controller.postsStreamSignal.value.map(
              data: (value) {
                print('value:$value');
                return Text(
                  value.title!,
                  style: Theme.of(context).textTheme.headlineMedium!,
                );
              },
              error: (error, _) {
                print('error:$error');
                return Text(
                  'error:$error',
                  style: Theme.of(context).textTheme.headlineMedium!,
                );
              },
              loading: () {
                print('loading');
                return const CircularProgressIndicator();
              },
              reloading: () {
                print('reloading');
                return const CircularProgressIndicator(
                  color: Colors.red,
                );
              },
              refreshing: () {
                print('refreshing');
                return const CircularProgressIndicator(
                  color: Colors.orange,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
