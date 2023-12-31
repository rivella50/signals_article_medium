import 'package:signals/signals.dart';
import 'package:signals_article/feature/posts/data/posts_repository.dart';
import 'package:signals_article/feature/posts/domain/post.dart';

class PostsStreamController {
  final postsStreamSignal = StreamSignal<Post>(debugLabel: 'Posts Stream Signal');

  final loggedIn = signal(true, debugLabel: 'loggedIn Signal');

  late final Function disposeEffect;

  PostsStreamController() {
    disposeEffect = effect(() {
      if (!loggedIn.value) {
        postsStreamSignal.reset();
      }
    }, debugLabel: 'loggedIn Effect');
  }

  void dispose() {
    disposeEffect();
    postsStreamSignal.dispose();
    loggedIn.dispose();
  }

  void startPostsStream() {
    loggedIn.value = true;
    postsStreamSignal.resetStream(PostsRepository().getPostsStream(5));
  }

  void changeLoginStatus(bool newStatus) {
    loggedIn.value = newStatus;
  }
}
