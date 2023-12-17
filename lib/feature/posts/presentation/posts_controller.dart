import 'package:signals/signals.dart';
import 'package:signals_article/feature/posts/application/posts_service.dart';
import 'package:signals_article/feature/posts/data/posts_repository.dart';
import 'package:signals_article/feature/posts/domain/post.dart';

class PostsController {
  final PostsService postService = PostsService();

  final postsSignal =
      signal<AsyncState<List<Post>>>(AsyncData(<Post>[]), debugLabel: 'posts Signal');

  final postsStreamSignal = StreamSignal<Post>(debugLabel: 'posts stream Signal');

  final loggedIn = signal(true, debugLabel: 'loggedIn Signal');

  PostsController() {
    effect(() {
      if (!loggedIn.value) {
        postsStreamSignal.reset();
      }
    }, debugLabel: 'loggedIn Effect');
  }

  Future<void> getPosts() async {
    postsSignal.value = AsyncLoading();
    final result = await postService.getUnevenPosts();
    result.mapLeft((a) =>
        postsSignal.value = AsyncError(a, StackTrace.current));
    result.map((list) => postsSignal.value = AsyncData(list));
  }

  void startPostsStream() {
    loggedIn.value = true;
    postsStreamSignal.resetStream(PostsRepository().getPostsStream(5));
  }

  void changeLoginStatus(bool newStatus) {
    loggedIn.value = newStatus;
  }
}
