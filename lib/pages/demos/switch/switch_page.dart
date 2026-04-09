import 'package:flutter/material.dart';
import 'package:fro/fro/widgets/index.dart';

class SwitchPage extends StatelessWidget {
  const SwitchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('开关')),
      body: FroScrollView(
        children: [
          FroCellGroup(
            children: [
              FroCell(onTap: () => {}, labelText: '开关', arrow: true),
              Switch(value: false, onChanged: (value) => {}),
              FroSwitch(value: false, onChanged: (value) => {}),
            ],
          ),
        ],
      ),
    );
  }
}
