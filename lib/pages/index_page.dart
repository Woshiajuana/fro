import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fro/fro/widgets/tabbar/index.dart';
import 'package:fro/utils/index.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;
  static const List<FroTabbarItem> _tabbarItems = [
    FroTabbarItem(
      icon: Icon(IconfontIcons.wapHomeO),
      activeIcon: Icon(IconfontIcons.wapHome),
      text: '首页',
    ),
    FroTabbarItem(
      icon: Icon(IconfontIcons.videoO),
      activeIcon: Icon(IconfontIcons.video),
      text: '演练场',
      badge: '10',
    ),
    FroTabbarItem(
      icon: Icon(IconfontIcons.managerO),
      activeIcon: Icon(IconfontIcons.manager),
      text: '我的',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: FroTabbar(
        items: _tabbarItems,
        currentIndex: navigationShell.currentIndex,
        onTap: (index) {
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
      ),
    );
  }
}
