import 'package:flutter/material.dart';
import 'package:fro/extensions/index.dart';
import 'package:fro/fro/index.dart';
import 'package:provider/provider.dart';
import 'package:fro/states/index.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final localeState = context.watch<LocaleState>();

    List<Widget> children = [
      FroCellGroup(
        children: [
          FroCell(
            labelText: context.l10n.languageSettingsAutomatic,
            trailing: Switch(
              value: localeState.isFollowSystem,
              onChanged: (v) {
                if (v) {
                  localeState.followSystem();
                } else {
                  // ...
                }
              },
            ),
          ),
        ],
      ),
    ];

    if (!localeState.isFollowSystem) {
      // ...
      children.addAll(
        localeState.languageCodeLabelMap.entries.map((e) {
          return FroCell(
            onTap: () {
              localeState.setLanguageCode(e.key);
            },
            labelText: e.value,
            value: localeState.languageCode == e.key
                ? Icon(Icons.check, color: context.theme.colorScheme.primary)
                : null,
          );
        }).toList(),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.languageSettingsTitle)),
      body: FroScrollView(children: children),
    );
  }
}
