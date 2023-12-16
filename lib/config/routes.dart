import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:signals_article/feature/posts/presentation/bottom_navigation_bar_scaffold.dart';
import 'package:signals_article/feature/posts/presentation/future/future_screen.dart';
import 'package:signals_article/feature/posts/presentation/stream/stream_screen.dart';

const String pathFuture = '/future';
const String pathStream = '/stream';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

GoRoute defaultTransitionRoute({
  required String path,
  required Widget Function(BuildContext, GoRouterState) pageBuilder,
  List<RouteBase>? routes,
}) {
  return GoRoute(
    path: path,
    pageBuilder: (context, state) => CustomTransitionPage<void>(
      key: state.pageKey,
      transitionDuration: const Duration(milliseconds: 300),
      child: pageBuilder(context, state),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeIn).animate(animation),
          child: child,
        );
      },
    ),
    routes: routes ?? [],
  );
}

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: pathFuture,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) =>
          BottomNavigationBarScaffold(child: child),
      routes: [
        defaultTransitionRoute(
          path: pathFuture,
          pageBuilder: (context, state) => const FutureScreen(),
        ),
        defaultTransitionRoute(
          path: pathStream,
          pageBuilder: (context, state) => const StreamScreen(),
        ),
      ],
    ),
  ],
);