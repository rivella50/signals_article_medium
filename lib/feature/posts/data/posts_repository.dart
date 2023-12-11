import 'package:dio/dio.dart';
import 'package:signals_article/feature/posts/domain/post.dart';
import 'package:signals_article/utils/constants.dart';
import 'package:signals_article/utils/exceptions.dart';
import 'package:signals_article/utils/task_chains.dart';
import 'package:fpdart/fpdart.dart';

class PostsRepository with TaskChains {
  TaskEither<ApiException, List<Post>> getPosts() {
    var dio = Dio();
    return TaskEither<ApiException, Response>.tryCatch(
      () => dio.get('$jsonPlaceholderBaseUrl/posts'),
      (object, stackTrace) => ApiErrorHandler.handleError(object),
    ).chainEither(errorOrBody).chainEither(errorOrPosts);
  }

  Stream<Post> getPostsStream(int count) async* {
    try {
      for (int i = 1; i <= count; i++) {
        await Future.delayed(const Duration(seconds: 1));
        yield Post(id: i, title: 'Post $i');
      }
    }finally {
      print('ended stream');
    }
  }
}
