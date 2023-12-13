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
              onPressed: () =>
                  //getIt.get<PostsController>().postsStreamSignal.value != null
                  //  ? null
                controller.startPostsStream(),
              child: const Text('Start Posts Stream')),
          const SizedBox(
            height: 20,
          ),
          Watch(
            (context) => controller.postsStreamSignal.map(
              value: (value) {
                print('value:$value');
                return Text(
                  value!.title!,
                  style: Theme.of(context).textTheme.headlineMedium!,
                );
              },
              error: (error) {
                print('error:$error');
                return Text(
                  'error:$error',
                  style: Theme.of(context).textTheme.headlineMedium!,
                );
              },
              loading: () {
                print('loading');
                return const CircularProgressIndicator();
                //return const SizedBox.shrink();
              },
              reloading: (val) {
                print('reloading');
                return const CircularProgressIndicator(color: Colors.red,);
              },
            ),
          ),
        ],
      ),
    );
  }
}
