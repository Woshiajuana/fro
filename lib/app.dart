import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:fro/pages/clickable_page.dart';
import 'package:fro/pages/index_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 标题
      title: 'FRO',

      // 配置 toast
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],

      // 配置 routes
      initialRoute: '/',
      routes: {
        '/': (context) => const IndexPage(),
        '/clickable': (context) => const ClickablePage(),
      },
    );
  }
}
