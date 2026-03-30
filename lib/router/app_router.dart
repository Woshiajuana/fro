import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fro/pages/cell_page.dart';
import 'package:fro/pages/clickable_page.dart';
import 'package:fro/pages/home_page.dart';
import 'package:fro/pages/index_page.dart';
import 'package:fro/pages/mine_page.dart';
import 'package:fro/pages/playground_page.dart';
import 'package:fro/pages/skeleton_page.dart';
import 'package:fro/pages/webview_page.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: '/mine',
    observers: [BotToastNavigatorObserver()],
    routes: [
      GoRoute(path: '/', redirect: (context, state) => '/playground'),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            IndexPage(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                pageBuilder: (context, state) =>
                    _buildSlidePage(state, const HomePage()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/playground',
                pageBuilder: (context, state) =>
                    _buildSlidePage(state, const PlaygroundPage()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/mine',
                pageBuilder: (context, state) =>
                    _buildSlidePage(state, const MinePage()),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/cell',
        pageBuilder: (context, state) =>
            _buildSlidePage(state, const CellPage()),
      ),
      GoRoute(
        path: '/clickable',
        pageBuilder: (context, state) =>
            _buildSlidePage(state, const ClickablePage()),
      ),
      GoRoute(
        path: '/skeleton',
        pageBuilder: (context, state) =>
            _buildSlidePage(state, const SkeletonPage()),
      ),
      GoRoute(
        path: '/webview',
        pageBuilder: (context, state) =>
            _buildSlidePage(state, const WebviewPage()),
      ),
    ],
  );

  static CustomTransitionPage<void> _buildSlidePage(
    GoRouterState state,
    Widget child,
  ) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: child,
      transitionDuration: const Duration(milliseconds: 300),
      reverseTransitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final Animation<Offset> position = Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.easeOutCubic)).animate(animation);
        return SlideTransition(position: position, child: child);
      },
    );
  }
}
