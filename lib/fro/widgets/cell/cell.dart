import 'package:flutter/material.dart';
import 'package:fro/fro/widgets/clickable/clickable.dart';

class FroCell extends StatelessWidget {
  const FroCell({
    super.key,
    this.leading,
    this.leadingIcon,
    this.labelText,
    this.label,
    this.descriptionText,
    this.description,
    this.valueText,
    this.value,
    this.trailing,
    this.arrow = false,
    this.color,
    this.onTap,
  });

  /// 左侧组件
  final Widget? leading;

  /// 左侧 icon
  final IconData? leadingIcon;

  /// 标签
  final String? labelText;

  /// 标签组件
  final Widget? label;

  /// 描述
  final String? descriptionText;

  /// 描述组件
  final Widget? description;

  /// 右侧文案
  final String? valueText;

  /// 右侧组件
  final Widget? value;

  /// trailing
  final Widget? trailing;

  /// 右箭头
  final bool arrow;

  /// color
  final Color? color;

  /// 点击
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
