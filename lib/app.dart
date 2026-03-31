import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fro/router/app_router.dart';
import 'package:fro/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  static final GoRouter _router = AppRouter.createRouter(
    observers: [BotToastNavigatorObserver()],
  );

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppTheme.controller,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'FRO',
          builder: BotToastInit(),
          routerConfig: _router,
          themeMode: AppTheme.controller.themeMode,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
        );
      },
    );
  }
}
