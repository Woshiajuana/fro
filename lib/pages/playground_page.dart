import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fro/fro/index.dart';

class PlaygroundPage extends StatelessWidget {
  const PlaygroundPage({super.key});

  @override
  Widget build(BuildContext context) {
    const List<Map<String, dynamic>> widgets = [
      {'path': '/cell', 'icon': Icons.view_list, 'label': '单元格'},
      {'path': '/clickable', 'icon': Icons.touch_app, 'label': '可点击'},
      {'path': '/skeleton', 'icon': Icons.dashboard, 'label': '骨架屏'},
      {'path': '/webview', 'icon': Icons.public, 'label': 'WebView'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('演练场')),
      body: GridView.count(
        crossAxisCount: 3,
        padding: const EdgeInsets.all(10),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: [
          ...widgets.map(
            (widget) => FroClickable(
              onTap: () => context.push(widget['path'] as String),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(widget['icon'], size: 42),
                  const SizedBox(height: 8),
                  Text(widget['label']),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
