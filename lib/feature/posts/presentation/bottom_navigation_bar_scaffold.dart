import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:signals_article/config/routes.dart';
import 'package:signals_article/feature/posts/presentation/posts_controller.dart';
import 'package:signals_article/main.dart';

class BottomNavigationBarScaffold extends StatefulWidget {
  BottomNavigationBarScaffold({
    super.key,
    required this.child,
  });

  Widget child;

  @override
  State<BottomNavigationBarScaffold> createState() =>
      _BottomNavigationBarScaffoldState();
}

class _BottomNavigationBarScaffoldState
    extends State<BottomNavigationBarScaffold> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        onTap: changeTab,
        backgroundColor: const Color(0xffecdaf5),
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.arrow_forward), label: 'Future'),
          BottomNavigationBarItem(icon: Icon(Icons.stream), label: 'Stream'),
        ],
      ),
    );
  }

  void changeTab(int index) {
    if (index == currentIndex) {
      return;
    }
    getIt.get<PostsController>().reset();
    switch (index) {
      case 0:
        context.go(pathFuture);
        break;
      case 1:
        context.go(pathStream);
        break;
    }
    setState(() {
      currentIndex = index;
    });
  }
}
