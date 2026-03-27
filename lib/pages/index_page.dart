import 'package:flutter/material.dart';
import 'package:fro/pages/home_page.dart';
import 'package:fro/pages/mine_page.dart';
import 'package:fro/pages/playground_page.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(children: [HomePage(), PlaygroundPage(), MinePage()]),
    );
  }
}
