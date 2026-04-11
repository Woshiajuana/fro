import 'package:flutter/material.dart';
import 'package:fro/extensions/index.dart';
import 'package:fro/fro/widgets/index.dart';
import 'package:fro/states/index.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.settingsTitle)),
      body: FroScrollView(
        children: [
          FroCellGroup(
            titleText: context.l10n.settingsDisplay,
            children: [
              Consumer<LocaleState>(
                builder: (context, localeState, _) {
                  final String languageCodeName = localeState.isFollowSystem
                      ? context.l10n.languageAutomatic
                      : (localeState.languageCodeLabelMap[localeState
                                .languageCode] ??
                            '简体中文');
                  return FroCell(
                    onTap: () {
                      context.push('/setting/language');
                    },
                    labelText: context.l10n.languageTitle,
                    valueText: languageCodeName,
                    arrow: true,
                  );
                },
              ),
              Consumer<ThemeState>(
                builder: (context, themeState, _) {
                  final String themeModeName = switch (themeState.themeMode) {
                    ThemeMode.system => context.l10n.themeAutomatic,
                    ThemeMode.light => context.l10n.themeLight,
                    ThemeMode.dark => context.l10n.themeDark,
                  };
                  return FroCell(
                    onTap: () {
                      context.push('/setting/theme');
                    },
                    labelText: context.l10n.settingsTheme,
                    valueText: themeModeName,
                    arrow: true,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
