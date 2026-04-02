import 'package:flutter/cupertino.dart';
import 'package:fro/pages/setting/language_page.dart';
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

  static GoRouter createRouter({List<NavigatorObserver> observers = const []}) {
    return GoRouter(
      initialLocation: '/language',
      observers: observers,
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
                      _buildCupertinoPage(state, const HomePage()),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/playground',
                  pageBuilder: (context, state) =>
                      _buildCupertinoPage(state, const PlaygroundPage()),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/mine',
                  pageBuilder: (context, state) =>
                      _buildCupertinoPage(state, const MinePage()),
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: '/cell',
          pageBuilder: (context, state) =>
              _buildCupertinoPage(state, const CellPage()),
        ),
        GoRoute(
          path: '/clickable',
          pageBuilder: (context, state) =>
              _buildCupertinoPage(state, const ClickablePage()),
        ),
        GoRoute(
          path: '/skeleton',
          pageBuilder: (context, state) =>
              _buildCupertinoPage(state, const SkeletonPage()),
        ),
        GoRoute(
          path: '/webview',
          pageBuilder: (context, state) =>
              _buildCupertinoPage(state, const WebviewPage()),
        ),
        GoRoute(
          path: '/language',
          pageBuilder: (context, state) =>
              _buildCupertinoPage(state, const LanguagePage()),
        ),
      ],
    );
  }

  static CupertinoPage<void> _buildCupertinoPage(
    GoRouterState state,
    Widget child,
  ) {
    return CupertinoPage<void>(key: state.pageKey, child: child);
  }
}
