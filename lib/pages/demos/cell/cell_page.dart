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
          const FroCellGroup(
            titleText: '基础用法',
            children: [
              FroCell(labelText: '单元格'),
              FroCell(labelText: '单元格', valueText: '内容'),
              FroCell(
                labelText: '单元格',
                valueText: '内容',
                descriptionText: '描述信息',
              ),
            ],
          ),
          const FroCellGroup(
            titleText: '卡片风格',
            inset: true,
            children: [
              FroCell(labelText: '单元格'),
              FroCell(labelText: '单元格', valueText: '内容'),
              FroCell(
                labelText: '单元格',
                valueText: '内容',
                descriptionText: '描述信息',
              ),
            ],
          ),
          const FroCellGroup(
            titleText: '展示图标/箭头',
            children: [
              FroCell(
                icon: Icons.settings,
                labelText: '单元格',
                valueText: '内容',
                arrow: true,
              ),
              FroCell(
                icon: Icons.info_outline,
                labelText: '单元格',
                valueText: '内容',
                arrow: true,
              ),
            ],
          ),
          FroCellGroup(
            titleText: '可点击',
            children: [
              FroCell(
                icon: Icons.settings,
                labelText: '单元格',
                valueText: '内容',
                arrow: true,
                onTap: () {
                  FroToast.showToast('点我了');
                },
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
        ],
      ),
    );
  }
}
