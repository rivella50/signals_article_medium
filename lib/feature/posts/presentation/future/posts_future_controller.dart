import 'package:signals/signals.dart';
import 'package:signals_article/feature/posts/application/posts_service.dart';
import 'package:signals_article/feature/posts/domain/post.dart';

class PostsFutureController {
  final PostsService postService = PostsService();

  final postsSignal =
    signal<AsyncState<List<Post>>>(AsyncData(<Post>[]), debugLabel: 'posts Signal');

  void dispose() {
    postsSignal.dispose();
  }

  Future<void> getPosts() async {
    postsSignal.value = AsyncLoading();
    final result = await postService.getUnevenPosts();
    result.mapLeft((a) =>
        postsSignal.value = AsyncError(a, StackTrace.current));
    result.map((list) => postsSignal.value = AsyncData(list));
  }
}
