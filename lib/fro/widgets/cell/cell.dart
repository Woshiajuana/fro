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
    final Widget leadingWidget =
        leading ??
        (leadingIcon != null
            ? Icon(leadingIcon, size: 20, color: const Color(0xFF646566))
            : const SizedBox.shrink());
    final bool hasLeading = leading != null || leadingIcon != null;

    final Widget labelWidget =
        label ??
        Text(
          labelText ?? '',
          style: const TextStyle(fontSize: 16, color: Color(0xFF323233)),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        );
    final Widget? descriptionWidget =
        description ??
        (descriptionText != null
            ? Text(
                descriptionText!,
                style: const TextStyle(fontSize: 12, color: Color(0xFF969799)),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )
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
            crossAxisAlignment: descriptionWidget != null
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            children: [
              if (hasLeading) ...[
                Padding(
                  padding: EdgeInsets.only(
                    top: descriptionWidget != null ? 2 : 0,
                  ),
                  child: leadingWidget,
                ),
                const SizedBox(width: 12),
              ],
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    labelWidget,
                    if (descriptionWidget != null) ...[
                      const SizedBox(height: 4),
                      descriptionWidget,
                    ],
                  ],
                ),
              ),
              if (valueWidget != null) ...[
                const SizedBox(width: 12),
                Flexible(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: valueWidget,
                  ),
                ),
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
