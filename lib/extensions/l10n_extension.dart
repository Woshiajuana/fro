import 'package:flutter/material.dart';
import 'package:fro/l10n/app_localizations.dart';

extension ThemeContextX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
