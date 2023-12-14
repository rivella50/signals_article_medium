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
          Row(
            children: [
              Expanded(
                flex: 2,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(45),
                    ),
                    onPressed: () => controller.startPostsStream(),
                    child: const Text('Start Posts Stream')),
              ),
              Watch((_) {
                return Expanded(
                  child: SwitchListTile(
                    title: const Text('Is Logged In'),
                    value: controller.loggedIn.value,
                    onChanged: (value) => controller.changeLoginStatus(!controller.loggedIn.value),
                  ),
                );
              }),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Watch(
            (context) => controller.postsStreamSignal.value.map(
              data: (value) {
                return Text(
                  value.title!,
                  style: Theme.of(context).textTheme.headlineMedium!,
                );
              },
              error: (error, _) {
                return Text(
                  'error:$error',
                  style: Theme.of(context).textTheme.headlineMedium!,
                );
              },
              loading: () {
                return const CircularProgressIndicator();
              },
              reloading: () {
                return const CircularProgressIndicator(
                  color: Colors.red,
                );
              },
              refreshing: () {
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
