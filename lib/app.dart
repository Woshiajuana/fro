import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:fro/router/app_router.dart';
import 'package:fro/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  static final GoRouter _router = AppRouter.createRouter(
    observers: [BotToastNavigatorObserver()],
  );

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppThemeProvider>(
      create: (_) => AppThemeProvider(),
      child: const _AppView(),
    );
  }
}

class _AppView extends StatelessWidget {
  const _AppView();

  @override
  Widget build(BuildContext context) {
    final ThemeMode themeMode = context.select<AppThemeProvider, ThemeMode>(
      (provider) => provider.themeMode,
    );
    return MaterialApp.router(
      title: 'FRO',
      builder: BotToastInit(),
      routerConfig: App._router,
      themeMode: themeMode,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
    );
  }
}
