import 'package:flutter/material.dart';
import 'package:fro/fro/index.dart';
import 'package:fro/states/theme_state.dart';
import 'package:provider/provider.dart';
import 'package:fro/extensions/index.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeState = context.watch<ThemeState>();
    final themeMode = themeState.themeMode;

    List<Widget> children = [
      FroCellGroup(
        children: [
          FroCell(
            labelText: context.l10n.themeAutomatic,
            descriptionText: context.l10n.themeAutomaticDescription,
            trailing: FroSwitch(
              value: themeState.isFollowSystem,
              onChanged: (v) {
                if (v) {
                  themeState.followSystem();
                } else {
                  if (FroHelper.isDarkMode(context)) {
                    themeState.useDark();
                  } else {
                    themeState.useLight();
                  }
                }
              },
            ),
          ),
        ],
      ),
    ];

    if (!themeState.isFollowSystem) {
      var checkIcon = Icon(
        Icons.check,
        color: context.theme.colorScheme.primary,
      );

      children.add(
        FroCellGroup(
          titleText: context.l10n.themeCustom,
          children: [
            FroCell(
              onTap: () => themeState.setThemeMode(ThemeMode.light),
              labelText: context.l10n.themeLight,
              trailing: themeMode == ThemeMode.light ? checkIcon : null,
            ),
            FroCell(
              onTap: () => themeState.setThemeMode(ThemeMode.dark),
              labelText: context.l10n.themeDark,
              trailing: themeMode == ThemeMode.dark ? checkIcon : null,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.themeTitle)),
      body: FroScrollView(children: children),
    );
  }
}
