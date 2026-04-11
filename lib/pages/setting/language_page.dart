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
            labelText: context.l10n.languageAutomatic,
            descriptionText: context.l10n.languageAutomaticDescription,
            trailing: FroSwitch(
              value: localeState.isFollowSystem,
              onChanged: (v) {
                if (v) {
                  localeState.followSystem();
                } else {
                  final String systemCode = Localizations.localeOf(
                    context,
                  ).languageCode;
                  final String nextCode =
                      localeState.languageCodeLabelMap.containsKey(systemCode)
                      ? systemCode
                      : 'zh';
                  localeState.setLanguageCode(nextCode);
                }
              },
            ),
          ),
        ],
      ),
    ];

    if (!localeState.isFollowSystem) {
      children.add(
        FroCellGroup(
          titleText: context.l10n.languageCustom,
          children: localeState.languageCodeLabelMap.entries.map((e) {
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
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.languageTitle)),
      body: FroScrollView(children: children),
    );
  }
}
