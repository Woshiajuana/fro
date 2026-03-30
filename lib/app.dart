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

class App extends StatelessWidget {
  const App({super.key});

  static final GoRouter _router = GoRouter(
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
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/playground',
                builder: (context, state) => const PlaygroundPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/mine',
                builder: (context, state) => const MinePage(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(path: '/cell', builder: (context, state) => const CellPage()),
      GoRoute(
        path: '/clickable',
        builder: (context, state) => const ClickablePage(),
      ),
      GoRoute(
        path: '/skeleton',
        builder: (context, state) => const SkeletonPage(),
      ),
      GoRoute(
        path: '/webview',
        builder: (context, state) => const WebviewPage(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // 标题
      title: 'FRO',

      // 配置 toast
      builder: BotToastInit(),
      routerConfig: _router,

      // 主题
      theme: ThemeData(scaffoldBackgroundColor: Colors.grey[200]),
    );
  }
}
