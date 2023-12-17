import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:signals_article/config/routes.dart';
import 'package:signals_article/feature/posts/presentation/future/posts_future_controller.dart';
import 'package:signals_article/feature/posts/presentation/stream/posts_stream_controller.dart';

final getIt = GetIt.instance;

void main() {
  setup();
  runApp(const MyApp());
}

void setup() {
  getIt.registerLazySingleton<PostsFutureController>(() =>
      PostsFutureController(),
  );
  getIt.registerLazySingleton<PostsStreamController>(() =>
      PostsStreamController(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Signals Posts',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: router,
    );
  }
}