import 'package:flutter/material.dart';
import 'package:fro/fro/widgets/index.dart';

class DialogPage extends StatelessWidget {
  const DialogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('弹窗')),
      body: FroScrollView(
        children: [
          FroCellGroup(
            children: [
              FroCell(onTap: () => {}, labelText: '下拉菜单弹窗', arrow: true),
            ],
          ),
        ],
      ),
    );
  }
}
