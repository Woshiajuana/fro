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
                  var languageCodeName = localeState.getLanguageCodeName(
                    context,
                  );
                  return FroCell(
                    onTap: () {
                      context.push('/setting/language');
                    },
                    labelText: context.l10n.settingsLanguage,
                    value: languageCodeName,
                    arrow: true,
                  );
                },
              ),
              Consumer<ThemeState>(
                builder: (context, themeState, _) {
                  var themeModeName = themeState.getThemeModeName(context);
                  return FroCell(
                    onTap: () {
                      context.push('/setting/theme');
                    },
                    labelText: context.l10n.settingsTheme,
                    value: themeModeName,
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
