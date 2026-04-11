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
  String get languageSettingsTitle => 'Language';

  @override
  String get languageSettingsAutomatic => 'Automatic';

  @override
  String get languageSettingsAutomaticDescription =>
      'Note: System presets only support languages from the list below.';

  @override
  String get themeSettingsTitle => 'Theme';

  @override
  String get themeSettingsAutomatic => 'Automatic';

  @override
  String get themeSettingsAutomaticDescription =>
      'After activation, it will follow the system to turn on or off the dark mode';

  @override
  String get themeSettingsCustom => 'Custom';

  @override
  String get themeSettingsLight => 'Light Mode';

  @override
  String get themeSettingsDark => 'Dark Mode';

  @override
  String get end => 'end';
}
