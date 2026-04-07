import 'package:flutter/material.dart';

import 'cell_group_theme.dart';

class FroCellGroup extends StatelessWidget {
  const FroCellGroup({
    super.key,
    required this.children,
    this.titleText,
    this.title,
    this.inset = false,
  });

  /// 单元格列表
  final List<Widget> children;

  /// 标题
  final String? titleText;

  /// 标题组件
  final Widget? title;

  /// 是否内边距，true 就展示卡片布局，false 就展示平铺布局
  final bool inset;

  @override
  Widget build(BuildContext context) {
    if (children.isEmpty) {
      return const SizedBox.shrink();
    }

    final ThemeData theme = Theme.of(context);
    final FroCellGroupTheme palette =
        theme.extension<FroCellGroupTheme>() ??
        FroCellGroupTheme.fallback(theme.brightness);

    List<Widget> content = [];
    for (var i = 0; i < children.length; i++) {
      content.add(children[i]);
      if (i != children.length - 1) {
        content.add(
          Divider(
            height: 0.5,
            thickness: 0.5,
            indent: 16,
            color: palette.dividerColor,
          ),
        );
      }
    }

    Widget current;
    if (inset) {
      current = Container(
        margin: const EdgeInsets.only(left: 16, right: 16),
        decoration: BoxDecoration(
          color: palette.backgroundColor,
          border: Border.all(color: palette.borderColor, width: 0.5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Column(children: content),
        ),
      );
    } else {
      current = Container(
        decoration: BoxDecoration(
          color: palette.backgroundColor,
          border: Border(
            top: BorderSide(color: palette.borderColor, width: 0.5),
            bottom: BorderSide(color: palette.borderColor, width: 0.5),
          ),
        ),
        child: Column(children: content),
      );
    }

    Widget? title;
    if (this.title != null) {
      title = this.title;
    } else if (titleText != null) {
      title = Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
        child: Text(
          titleText!,
          style: TextStyle(fontSize: 13, color: palette.titleColor),
        ),
      );
    }

    if (title != null) {
      current = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [title, current],
      );
    }

    return current;
  }
}
