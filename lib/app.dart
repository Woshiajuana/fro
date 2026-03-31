import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fro/router/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  static final GoRouter _router = AppRouter.createRouter(
    observers: [BotToastNavigatorObserver()],
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
