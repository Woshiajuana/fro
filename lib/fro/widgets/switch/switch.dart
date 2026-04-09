import 'package:flutter/material.dart';

class FroSwitch extends StatelessWidget {
  const FroSwitch({
    super.key,
    required this.value,
    required this.onChange,
    this.activeColor,
    this.inactiveColor,
    this.future,
  });

  /// 值
  final bool value;

  /// 值改变时调用
  final ValueChanged<bool> onChange;

  /// 颜色
  final Color? activeColor;

  /// 颜色
  final Color? inactiveColor;

  /// 异步任务
  final Future<bool>? future;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
