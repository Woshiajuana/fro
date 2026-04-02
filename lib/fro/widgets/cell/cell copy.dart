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
    final Widget labelWidget =
        label ??
        Text(
          labelText ?? '',
          style: const TextStyle(fontSize: 16, color: Color(0xFF323233)),
        );
    final Widget? leadingWidget =
        leading ??
        (icon != null
            ? Icon(icon, size: 20, color: const Color(0xFF646566))
            : null);
    final Widget? valueWidget =
        value ??
        (valueText != null
            ? Text(
                valueText!,
                style: const TextStyle(fontSize: 14, color: Color(0xFF969799)),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            : null);
    final Widget? trailingWidget =
        trailing ??
        (arrow
            ? const Icon(
                Icons.keyboard_arrow_right,
                size: 20,
                color: Color(0xFFC8C9CC),
              )
            : null);

    return FroClickable(
      onTap: onTap,
      clickable: onTap != null,
      color: color ?? Colors.white,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 50),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              if (leadingWidget != null) ...[
                leadingWidget,
                const SizedBox(width: 12),
              ],
              Expanded(child: labelWidget),
              if (valueWidget != null) ...[
                const SizedBox(width: 12),
                Flexible(child: valueWidget),
              ],
              if (trailingWidget != null) ...[
                const SizedBox(width: 8),
                trailingWidget,
              ],
            ],
          ),
        ),
      ),
    );
  }
}
