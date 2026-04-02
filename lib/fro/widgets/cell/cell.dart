import 'package:flutter/material.dart';
import 'package:fro/fro/widgets/clickable/clickable.dart';

class FroCell extends StatelessWidget {
  const FroCell({
    super.key,
    this.onTap,
    this.labelText,
    this.label,
    this.valueText,
    this.value,
    this.arrow = false,
    this.icon,
    this.leading,
    this.trailing,
    this.color,
  });

  /// 点击
  final void Function()? onTap;

  /// label text
  final String? labelText;

  /// label text
  final Widget? label;

  /// 描述信息
  final String? description;

  /// value text
  final String? valueText;

  /// value widget
  final Widget? value;

  /// 右箭头
  final bool arrow;

  /// leading
  final Widget? leading;

  /// trailing
  final Widget? trailing;

  /// icon
  final IconData? icon;

  /// color
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
