import 'package:flutter/material.dart';
import 'package:fro/fro/utils/index.dart';

class LocaleState extends ChangeNotifier {
  LocaleState()
    : _languageCode = _languageCodeStorage.getItem(_systemLanguageCode);

  static const _systemLanguageCode = 'system';
  static const _supportedCodes = ['en', 'zh'];
  static final _languageCodeStorage = FroStorage<String>(
    key: 'app.locale.languageCode',
    initialValue: _systemLanguageCode,
  );

  String _languageCode;

  String get languageCode => _languageCode;

  Locale? get locale {
    if (_languageCode == _systemLanguageCode) {
      return null;
    }
    return Locale(_languageCode);
  }

  bool get isFollowSystem => _languageCode == _systemLanguageCode;

  Map<String, String> get languageCodeLabelMap => const {
    'zh': '简体中文',
    'en': 'English',
  };

  Future<void> setLanguageCode(String languageCode) async {
    final String nextCode = _normalizeCode(languageCode);
    if (_languageCode == nextCode) {
      return;
    }
    _languageCode = nextCode;
    notifyListeners();
    await _languageCodeStorage.setItem(_languageCode);
  }

  Future<void> followSystem() => setLanguageCode(_systemLanguageCode);

  Future<void> useEnglish() => setLanguageCode('en');

  Future<void> useChinese() => setLanguageCode('zh');

  String _normalizeCode(String languageCode) {
    if (languageCode == _systemLanguageCode) {
      return _systemLanguageCode;
    }
    return _supportedCodes.contains(languageCode) ? languageCode : 'zh';
  }
}
