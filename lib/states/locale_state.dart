import 'package:flutter/material.dart';

class LocaleState extends ChangeNotifier {
  // 语言 code
  late String _languageCode;
  String get languageCode => _languageCode;

  //  语言
  Locale? get locale {
    // 跟随系统
    if (_languageCode != 'system') {
      return Locale(_languageCode);
    }
    return null;
  }
}
