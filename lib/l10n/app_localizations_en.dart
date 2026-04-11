// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'FRO';

  @override
  String get test => 'Test';

  @override
  String get mainTabbarHome => 'Home';

  @override
  String get mainTabbarMine => 'Mine';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsDisplay => 'Display';

  @override
  String get settingsLanguage => 'Language';

  @override
  String get settingsTheme => 'Theme';

  @override
  String get languageTitle => 'Language';

  @override
  String get languageAutomatic => 'Automatic';

  @override
  String get languageAutomaticDescription =>
      'Note: System presets only support languages from the list below.';

  @override
  String get languageCustom => 'Custom';

  @override
  String get themeTitle => 'Theme';

  @override
  String get themeAutomatic => 'Automatic';

  @override
  String get themeAutomaticDescription =>
      'After activation, it will follow the system to turn on or off the dark mode';

  @override
  String get themeCustom => 'Custom';

  @override
  String get themeLight => 'Light Mode';

  @override
  String get themeDark => 'Dark Mode';

  @override
  String get end => 'end';
}
