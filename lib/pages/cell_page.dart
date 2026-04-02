import 'package:flutter/material.dart';
import 'package:fro/fro/index.dart';

class CellPage extends StatelessWidget {
  const CellPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('单元格')),
      body: ListView(
        children: [
          const ListTile(title: Text('Cell 组件示例')),
          FroCellGroup(
            titleText: '基础',
            children: [
              FroCell(labelText: '仅标题'),
              FroCell(labelText: '带描述', descriptionText: '这里是描述文案，展示在标题下方'),
              FroCell(labelText: '带箭头', arrow: true),
              FroCell(labelText: '带值', valueText: '内容描述', arrow: true),
              FroCell(
                leadingIcon: Icons.settings,
                labelText: '带图标',
                descriptionText: '点击后触发回调',
                valueText: '去设置',
                arrow: true,
                onTap: () => FroToast.showToast('点击了设置项'),
              ),
            ],
          ),
          FroCellGroup(
            titleText: '自定义',
            children: [
              FroCell(
                label: const Text('自定义标题'),
                description: const Text(
                  '自定义描述组件',
                  style: TextStyle(fontSize: 12, color: Color(0xFF969799)),
                ),
                value: const Text('自定义值'),
                trailing: const Icon(Icons.info_outline, size: 18),
              ),
              FroCell(
                leading: const CircleAvatar(radius: 10, child: Text('A')),
                labelText: '自定义 leading',
                trailing: const Icon(Icons.more_horiz),
              ),
            ],
          ),
          FroCellGroup(
            titleText: '撑满宽度',
            inset: false,
            children: [
              FroCell(labelText: '无圆角样式', valueText: 'Plain'),
              FroCell(labelText: '撑满宽度', arrow: true),
            ],
          ),
        ],
      ),
    );
  }
}
