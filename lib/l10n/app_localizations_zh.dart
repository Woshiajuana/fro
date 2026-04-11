// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'FRO';

  @override
  String get test => '测试';

  @override
  String get mainTabbarHome => '首页';

  @override
  String get mainTabbarMine => '我的';

  @override
  String get settingsTitle => '设置';

  @override
  String get settingsDisplay => '界面和显示';

  @override
  String get settingsLanguage => '语言设置';

  @override
  String get settingsTheme => '主题设置';

  @override
  String get languageTitle => '语言设置';

  @override
  String get languageAutomatic => '跟随系统';

  @override
  String get languageAutomaticDescription => '注意：跟随系统仅支持以下列表中的语言。';

  @override
  String get languageCustom => '手动选择';

  @override
  String get themeTitle => '主题设置';

  @override
  String get themeAutomatic => '跟随系统';

  @override
  String get themeAutomaticDescription => '开启后，将跟随系统打开或关闭深色模式';

  @override
  String get themeCustom => '手动选择';

  @override
  String get themeLight => '亮色模式';

  @override
  String get themeDark => '深色模式';

  @override
  String get end => 'end';
}
