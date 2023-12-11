import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:signals_article/feature/posts/presentation/posts_controller.dart';
import 'package:signals_article/feature/posts/presentation/future/posts_widget.dart';
import 'package:signals_article/feature/posts/presentation/stream/posts_stream_widget.dart';

final getIt = GetIt.instance;

void main() {
  setup();
  runApp(const MyApp());
}

void setup() {
  getIt.registerSingleton<PostsController>(
    PostsController(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Signals Posts',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Signals Posts'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    PostsWidget(),
                    Divider(),
                    PostsStreamWidget(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
