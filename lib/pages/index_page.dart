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

  final List<Widget Function()> _pageBuilders = [
    () => const HomePage(),
    () => const PlaygroundPage(),
    () => const MinePage(),
  ];
  late final List<Widget?> _loadedPages;
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
  void initState() {
    super.initState();
    _loadedPages = List<Widget?>.filled(_pageBuilders.length, null);
    _loadedPages[_currentIndex] = _pageBuilders[_currentIndex]();
  }

  void _switchTab(int index) {
    if (_loadedPages[index] == null) {
      _loadedPages[index] = _pageBuilders[index]();
    }
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: List<Widget>.generate(
          _loadedPages.length,
          (index) => _loadedPages[index] ?? const SizedBox.shrink(),
        ),
      ),
      bottomNavigationBar: FroTabbar(
        items: _tabbarItems,
        currentIndex: _currentIndex,
        backgroundColor: Colors.amber,
        onTap: _switchTab,
      ),
    );
  }
}
