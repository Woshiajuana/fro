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
          FroCellGroup(
            titleText: '基础',
            children: [
              const FroCell(labelText: '仅标题'),
              const FroCell(
                labelText: '这里是描述文案，展示在标题下方这里是描述文案，展示在标题下方这里是描述文案，展示在标题下方',
              ),
              const FroCell(
                labelText: '带描述',
                descriptionText: '这里是描述文案，展示在标题下方',
              ),
              const FroCell(
                leadingIcon: Icons.settings,
                labelText: '带箭头',
                arrow: true,
              ),
              const FroCell(labelText: '带值带值值', valueText: '内容描述', arrow: true),
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
          const FroCellGroup(
            titleText: '自定义',
            children: [
              FroCell(
                label: Text('自定义标题'),
                description: Text(
                  '自定义描述组件',
                  style: TextStyle(fontSize: 12, color: Color(0xFF969799)),
                ),
                value: Text('自定义值'),
                trailing: Icon(Icons.info_outline, size: 18),
              ),
              FroCell(
                leading: CircleAvatar(radius: 10, child: Text('A')),
                labelText: '自定义 leading',
                trailing: Icon(Icons.more_horiz),
              ),
            ],
          ),
          const FroCellGroup(
            titleText: '圆角',
            inset: true,
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
