import 'package:flutter/material.dart';

enum FroCellGroupStyle { card, plain }

class FroCellGroup extends StatelessWidget {
  const FroCellGroup({
    required this.children,
    this.titleText,
    this.title,
    this.margin = const EdgeInsets.fromLTRB(12, 12, 12, 0),
    this.backgroundColor = Colors.white,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.style = FroCellGroupStyle.card,
    super.key,
  });

  final List<Widget> children;
  final String? titleText;
  final Widget? title;
  final EdgeInsetsGeometry margin;
  final Color backgroundColor;
  final BorderRadius borderRadius;
  final FroCellGroupStyle style;

  @override
  Widget build(BuildContext context) {
    final Widget? titleWidget =
        title ??
        (titleText != null
            ? Padding(
                padding: const EdgeInsets.only(left: 4, bottom: 8),
                child: Text(
                  titleText!,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF969799),
                  ),
                ),
              )
            : null);
    final bool isCard = style == FroCellGroupStyle.card;
    final EdgeInsetsGeometry groupMargin = isCard ? margin : EdgeInsets.zero;
    final BorderRadius groupBorderRadius = isCard
        ? borderRadius
        : BorderRadius.zero;

    return Container(
      margin: groupMargin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (titleWidget != null) titleWidget,
          ClipRRect(
            borderRadius: groupBorderRadius,
            child: DecoratedBox(
              decoration: BoxDecoration(color: backgroundColor),
              child: Column(
                children: List<Widget>.generate(children.length, (index) {
                  if (index == children.length - 1) {
                    return children[index];
                  }
                  return Column(
                    children: [
                      children[index],
                      const Divider(
                        height: 1,
                        thickness: 0.5,
                        color: Color(0xFFF2F3F5),
                        indent: 16,
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
