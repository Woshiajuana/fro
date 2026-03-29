import 'package:flutter/material.dart';
import 'package:fro/fro/widgets/tabbar/index.dart';
import 'package:fro/pages/home_page.dart';
import 'package:fro/pages/mine_page.dart';
import 'package:fro/pages/playground_page.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [HomePage(), PlaygroundPage(), MinePage()];
  final List<FroTabbarItem> _tabbarItems = const [
    FroTabbarItem(
      icon: Icon(Icons.home_outlined),
      activeIcon: Icon(Icons.home),
      text: '首页',
      dot: true,
    ),
    FroTabbarItem(
      icon: Icon(Icons.sports_esports_outlined),
      activeIcon: Icon(Icons.sports_esports),
      text: '演练场',
      badge: '10',
    ),
    FroTabbarItem(
      icon: Icon(Icons.person_outline),
      activeIcon: Icon(Icons.person),
      text: '我的',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: FroTabbar(
        height: 100,
        items: _tabbarItems,
        currentIndex: _currentIndex,
        backgroundColor: Colors.amber,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
