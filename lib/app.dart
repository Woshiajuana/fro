import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:fro/l10n/app_localizations.dart';
import 'package:fro/states/index.dart';
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
    return MultiProvider(
      providers: [
        // 主题
        ChangeNotifierProvider(create: (_) => ThemeState()),
        // 国际化
        ChangeNotifierProvider(create: (_) => LocaleState()),
      ],
      builder: (context, child) {
        return Consumer2<ThemeState, LocaleState>(
          builder: (context, themeState, localeState, child) {
            return MaterialApp.router(
              // 应用标题
              title: 'FRO',

              // 主题模式
              themeMode: themeState.themeMode,
              theme: AppTheme.light,
              darkTheme: AppTheme.dark,

              // 国际化
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: localeState.locale,
              localeResolutionCallback: (locale, supportedLocales) {
                if (supportedLocales.contains(locale)) {
                  return locale;
                }
                return const Locale('zh');
              },

              // 路由配置
              routerConfig: _router,

              // 初始化 BotToast
              builder: BotToastInit(),
            );
          },
        );
      },
    );
  }
}
