import 'package:signals/signals.dart';
import 'package:signals_article/feature/posts/application/posts_service.dart';
import 'package:signals_article/feature/posts/data/posts_repository.dart';
import 'package:signals_article/feature/posts/domain/post.dart';
import 'package:signals_article/utils/async_value.dart';

// https://github.com/rodydavis/signals.dart/discussions/68#discussioncomment-7812017

class PostsController {
  final PostsService postService = PostsService();

  final postsSignal = signal<AsyncValue>(AsyncData(<Post>[]));
  
  AsyncSignal<Post?> postsStreamSignal = asyncSignalFromStream( () => const Stream<Post?>.empty(), initialValue: null);

  Future<void> getPosts() async {
    postsSignal.value = AsyncLoading();
    final result = await postService.getUnevenPosts();
    result
        .mapLeft((a) => postsSignal.value = AsyncError(a, StackTrace.current));
    result.map((list) => postsSignal.value = AsyncData(list));
  }
  
  void startPostsStream() {
    postsStreamSignal.resetStream(() => PostsRepository().getPostsStream(5));
  }
}
