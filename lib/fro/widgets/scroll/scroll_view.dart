import 'package:flutter/material.dart';

class FroScrollView extends StatelessWidget {
  const FroScrollView({
    super.key,
    this.children = const <Widget>[],
    this.placeholder = false,
    this.placeholderHeight = 120,
  });

  final List<Widget> children;

  final bool placeholder;
  final double placeholderHeight;

  @override
  Widget build(BuildContext context) {
    List<Widget> children = this.children;

    if (placeholder) {
      children.add(SizedBox(height: placeholderHeight));
    }

    return SizedBox.expand(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: children,
        ),
      ),
    );
  }
}