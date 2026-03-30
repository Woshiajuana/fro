import 'package:flutter/material.dart';
import 'package:fro/fro/widgets/tabbar/index.dart';
import 'package:fro/pages/home_page.dart';
import 'package:fro/pages/mine_page.dart';
import 'package:fro/pages/playground_page.dart';
import 'package:fro/utils/index.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int _currentIndex = 1;

  final List<Widget Function()> _pageBuilders = [
    () => const HomePage(),
    () => const PlaygroundPage(),
    () => const MinePage(),
  ];
  late final List<Widget?> _loadedPages;

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
        items: const [
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
        ],
        currentIndex: _currentIndex,
        onTap: _switchTab,
      ),
    );
  }
}
