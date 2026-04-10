import 'package:flutter/material.dart';
import 'package:fro/fro/index.dart';
import 'package:fro/states/theme_state.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    var themeState = context.watch<ThemeState>();
    var themeMode = themeState.themeMode;

    List<Widget> children = [
      FroCellGroup(
        children: [
          FroCell(
            label: context.l10n.themeSettingsAutomatic,
            description: context.l10n.themeSettingsAutomaticDescription,
            trailing: Switch(
              value: themeState.isFollowSystem,
              onChanged: (v) {
                if (v) {
                  themeState.changeThemeMode(ThemeMode.system);
                } else {
                  themeState.changeThemeMode(
                    FroHelper.isDarkMode(context)
                        ? ThemeMode.dark
                        : ThemeMode.light,
                  );
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
          title: context.l10n.themeSettingsCustom,
          children: [
            FroCell(
              onTap: () => themeState.changeThemeMode(ThemeMode.light),
              label: context.l10n.themeSettingsLight,
              trailing: themeMode == ThemeMode.light ? checkIcon : null,
            ),
            FroCell(
              onTap: () => themeState.changeThemeMode(ThemeMode.dark),
              label: context.l10n.themeSettingsDark,
              trailing: themeMode == ThemeMode.dark ? checkIcon : null,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.themeSettingsTitle)),
      body: FroScrollView(children: children),
    );
  }
}
