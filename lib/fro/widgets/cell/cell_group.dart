import 'package:flutter/material.dart';

class FroCellGroup extends StatelessWidget {
  const FroCellGroup({
    super.key,
    required this.children,
    this.titleText,
    this.title,
    this.inset = true,
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
    // 没有子组件
    if (children.isEmpty) {
      return const SizedBox.shrink();
    }

    // 子组件列表
    List<Widget> content = [];
    for (var i = 0; i < children.length; i++) {
      content.add(children[i]);
      if (i != children.length - 1) {
        content.add(
          Divider(
            height: 0.5,
            thickness: 0.5,
            indent: inset ? 16 : 0,
            color: Colors.grey,
          ),
        );
      }
    }

    // 容器
    Widget current;
    if (inset) {
      current = Container(
        margin: const EdgeInsets.only(left: 16, right: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey, width: 0.5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Column(children: content),
        ),
      );
    } else {
      current = Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Colors.grey, width: 0.5),
            bottom: BorderSide(color: Colors.grey, width: 0.5),
          ),
        ),
        child: Column(children: content),
      );
    }

    // 标题组件
    Widget? titleWidget;
    if (title != null) {
      titleWidget = title;
    } else if (titleText != null) {
      titleWidget = Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
        child: Text(
          titleText!,
          style: TextStyle(fontSize: 13, color: Colors.grey[600]),
        ),
      );
    }

    if (titleWidget != null) {
      current = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [titleWidget, current],
      );
    }

    return current;
  }
}
