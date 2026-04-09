import 'package:flutter/material.dart';
import 'package:fro/fro/widgets/index.dart';

class SwitchPage extends StatefulWidget {
  const SwitchPage({super.key});

  @override
  State<SwitchPage> createState() => _SwitchPageState();
}

class _SwitchPageState extends State<SwitchPage> {
  bool _baseValue = false;
  bool _asyncValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('开关')),
      body: FroScrollView(
        children: [
          Switch(value: _baseValue, onChanged: (value) => {}),
          FroCellGroup(
            children: [
              FroCell(
                labelText: '基础开关',
                value: FroSwitch(
                  value: _baseValue,
                  onChange: (value) {
                    setState(() {
                      _baseValue = value;
                    });
                  },
                ),
              ),
              FroCell(
                labelText: '异步开关',
                descriptionText: '点击后模拟异步请求，结果决定最终状态',
                value: FroSwitch(
                  value: _asyncValue,
                  onChange: (value) {
                    setState(() {
                      _asyncValue = value;
                    });
                  },
                  future: (nextValue) async {
                    await Future<void>.delayed(
                      const Duration(milliseconds: 900),
                    );
                    return nextValue;
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
