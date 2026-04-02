import 'package:flutter/material.dart';

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
    return Container();
  }
}
