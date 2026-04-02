import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fro/states/index.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final LocaleState localeState = context.watch<LocaleState>();
    final bool isFollowSystem = localeState.isFollowSystem;
    final String languageCode = localeState.languageCode;

    return Scaffold(
      appBar: AppBar(title: const Text('语言设置')),
      body: ListView(
        children: [
          SwitchListTile.adaptive(
            title: const Text('跟随系统'),
            value: isFollowSystem,
            onChanged: (value) {
              if (value) {
                context.read<LocaleState>().followSystem();
                return;
              }
              if (languageCode == 'en') {
                return;
              }
              context.read<LocaleState>().useChinese();
            },
          ),
          if (!isFollowSystem) ...[
            const Divider(height: 1),
            ListTile(
              title: const Text('中文'),
              trailing: languageCode == 'zh'
                  ? const Icon(Icons.check, color: Color(0xFF1989FA))
                  : null,
              onTap: () => context.read<LocaleState>().useChinese(),
            ),
            const Divider(height: 1),
            ListTile(
              title: const Text('English'),
              trailing: languageCode == 'en'
                  ? const Icon(Icons.check, color: Color(0xFF1989FA))
                  : null,
              onTap: () => context.read<LocaleState>().useEnglish(),
            ),
          ],
        ],
      ),
    );
  }
}
