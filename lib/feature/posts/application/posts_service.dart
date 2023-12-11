import 'dart:async';

import 'package:signals_article/feature/posts/data/posts_repository.dart';
import 'package:signals_article/feature/posts/domain/post.dart';
import 'package:signals_article/utils/exceptions.dart';
import 'package:fpdart/fpdart.dart';

class PostsService {
  final PostsRepository repository = PostsRepository();

  Future<Either<ApiException, List<Post>>> getUnevenPosts() {
    return repository
        .getPosts()
        .flatMap(TaskEither.tryCatchK(
          (list) async => list.where((post) => post.id!.isOdd).toList(),
          (_, __) => ApiException(message: 'error when filtering posts'),
        ))
        .run();
  }
}
