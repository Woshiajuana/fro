import 'package:flutter/material.dart';

class FroHelper {
  FroHelper._();

  /// 判断值是否为空
  static bool isEmpty(dynamic value) {
    if (value == null) {
      return true;
    }
    if (value is String || value is List || value is Map) {
      return value.isEmpty;
    }
    return false;
  }

  /// 判断值是否不为空
  static bool isNotEmpty(dynamic value) => !isEmpty(value);

  /// 判断是否为暗黑模式
  static isDarkMode(BuildContext context) {
    return MediaQuery.platformBrightnessOf(context) == Brightness.dark;
  }
}
