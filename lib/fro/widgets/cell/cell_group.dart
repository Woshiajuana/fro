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

  Widget? _getTitleWidget() {
    Widget? result;
    if (title != null) {
      result = title;
    } else if (titleText != null) {
      result = Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
        child: Text(
          titleText!,
          style: TextStyle(fontSize: 13, color: Colors.grey[600]),
        ),
      );
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
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
    late Widget result;
    if (inset) {
      result = Container(
        margin: EdgeInsets.only(left: 16, right: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey, width: 0.5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(children: content),
      );
    } else {
      result = Container(
        decoration: BoxDecoration(
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
    Widget? title = _getTitleWidget();
    if (title != null) {
      result = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [title, result],
      );
    }

    return result;
  }

  @override
  Widget build1(BuildContext context) {
    final Widget? titleWidget =
        title ??
        (titleText != null
            ? Padding(
                padding: EdgeInsets.only(left: inset ? 4 : 16, bottom: 8),
                child: Text(
                  titleText!,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF969799),
                  ),
                ),
              )
            : null);

    return Container(
      margin: inset
          ? const EdgeInsets.fromLTRB(12, 12, 12, 0)
          : const EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (titleWidget != null) titleWidget,
          ClipRRect(
            borderRadius: inset
                ? const BorderRadius.all(Radius.circular(8))
                : BorderRadius.zero,
            child: DecoratedBox(
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                children: List<Widget>.generate(children.length, (index) {
                  if (index == children.length - 1) {
                    return children[index];
                  }
                  return Column(
                    children: [
                      children[index],
                      Divider(
                        height: 1,
                        thickness: 0.5,
                        color: const Color(0xFFF2F3F5),
                        indent: inset ? 16 : 0,
                      ),
                    ],
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
