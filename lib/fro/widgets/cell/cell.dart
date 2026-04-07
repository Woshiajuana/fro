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

  List<Widget> _buildLeading(BuildContext context) {
    List<Widget> res = [];
    if (leadingIcon != null) {
      res
        ..add(Icon(leadingIcon, color: Theme.of(context).primaryColor))
        ..add(const SizedBox(width: 12));
    }
    if (leading != null) {
      res
        ..add(leading!)
        ..add(const SizedBox(width: 12));
    }
    return res;
  }

  List<Widget> _buildLabel(BuildContext context) {
    Widget caption =
        label ??
        (labelText != null
            ? Text(labelText!, style: const TextStyle(fontSize: 17))
            : const SizedBox.shrink());

    var desc =
        description ??
        (descriptionText != null
            ? Text(
                descriptionText!,
                style: const TextStyle(fontSize: 13, color: Colors.grey),
                softWrap: true,
              )
            : null);

    if (desc != null) {
      caption = Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [caption, const SizedBox(height: 1), desc],
      );
    }

    // caption = Flexible(fit: FlexFit.loose, child: caption);

    return [caption];
  }

  List<Widget> _buildValue(BuildContext context) {
    Widget? child =
        value ??
        (valueText != null
            ? Text(
                valueText!,
                textAlign: TextAlign.right,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Theme.of(
                    context,
                  ).listTileTheme.textColor?.withAlpha(150),
                  fontSize: 16,
                ),
              )
            : null);

    List<Widget> res = [];
    if (child != null) {
      res
        ..add(const SizedBox(width: 12))
        ..add(Flexible(fit: FlexFit.tight, child: child));
    } else {
      res.add(const Flexible(fit: FlexFit.tight, child: SizedBox.shrink()));
    }

    return res;
  }

  List<Widget> _buildArrow(BuildContext context) {
    List<Widget> res = [];
    if (arrow) {
      res
        ..add(const SizedBox(width: 12))
        ..add(
          Icon(
            Icons.arrow_forward_ios,
            color: Theme.of(context).listTileTheme.iconColor,
            size: 18,
          ),
        );
    }
    return res;
  }

  List<Widget> _buildTrailing(BuildContext context) {
    List<Widget> res = [];
    if (trailing != null) {
      res
        ..add(const SizedBox(width: 12))
        ..add(trailing!);
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    Widget current = ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 54),
      child: Padding(
        padding: const EdgeInsetsGeometry.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        child: Row(
          children: [
            ..._buildLeading(context),
            ..._buildLabel(context),
            ..._buildValue(context),
            ..._buildArrow(context),
            ..._buildTrailing(context),
          ],
        ),
      ),
    );

    if (onTap != null) {
      current = Material(
        child: InkWell(onTap: onTap, child: current),
      );
    }

    return current;
  }

  @override
  Widget build1(BuildContext context) {
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
