import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fro/pages/demos/dialog/dialog_page.dart';
import 'package:fro/pages/demos/switch/switch_page.dart';
import 'package:fro/pages/setting/language_page.dart';
import 'package:fro/pages/setting/setting_page.dart';
import 'package:fro/pages/setting/theme_page.dart';
import 'package:fro/router/demo_route.dart';
import 'package:go_router/go_router.dart';
import 'package:fro/pages/demos/cell/cell_page.dart';
import 'package:fro/pages/demos/clickable/clickable_page.dart';
import 'package:fro/pages/home_page.dart';
import 'package:fro/pages/index_page.dart';
import 'package:fro/pages/mine_page.dart';
import 'package:fro/pages/playground_page.dart';
import 'package:fro/pages/demos/skeleton/skeleton_page.dart';
import 'package:fro/pages/demos/webview/webview_page.dart';

class AppRouter {
  AppRouter._();

  static GoRouter createRouter({List<NavigatorObserver> observers = const []}) {
    return GoRouter(
      initialLocation: '/demos/switch',
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

        ...demoRoutes,

        GoRoute(
          path: '/setting',
          pageBuilder: (context, state) =>
              _buildCupertinoPage(state, const SettingPage()),
        ),
        GoRoute(
          path: '/setting/language',
          pageBuilder: (context, state) =>
              _buildCupertinoPage(state, const LanguagePage()),
        ),
        GoRoute(
          path: '/setting/theme',
          pageBuilder: (context, state) =>
              _buildCupertinoPage(state, const ThemePage()),
        ),
      ],
    );
  }

  static List<DemoRoute> demoRoutes = [
    DemoRoute(
      icon: Icons.view_list,
      title: '单元格',
      path: '/demos/cell',
      pageBuilder: (context, state) =>
          _buildCupertinoPage(state, const CellPage()),
    ),
    DemoRoute(
      icon: Icons.ads_click,
      title: '可点击',
      path: '/demos/clickable',
      pageBuilder: (context, state) =>
          _buildCupertinoPage(state, const ClickablePage()),
    ),
    DemoRoute(
      icon: Icons.toggle_on,
      title: '开关',
      path: '/demos/switch',
      pageBuilder: (context, state) =>
          _buildCupertinoPage(state, const SwitchPage()),
    ),
    DemoRoute(
      icon: Icons.dashboard,
      title: '骨架屏',
      path: '/demos/skeleton',
      pageBuilder: (context, state) =>
          _buildCupertinoPage(state, const DialogPage()),
    ),
    DemoRoute(
      icon: Icons.chat,
      title: '弹窗',
      path: '/demos/dialog',
      pageBuilder: (context, state) =>
          _buildCupertinoPage(state, const SkeletonPage()),
    ),
    DemoRoute(
      icon: Icons.public,
      title: 'WebView',
      path: '/demos/webview',
      pageBuilder: (context, state) =>
          _buildCupertinoPage(state, const WebviewPage()),
    ),
  ];

  static CupertinoPage<void> _buildCupertinoPage(
    GoRouterState state,
    Widget child,
  ) {
    return CupertinoPage<void>(key: state.pageKey, child: child);
  }
}
