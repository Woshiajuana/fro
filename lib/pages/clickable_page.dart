import 'package:flutter/material.dart';
import 'package:fro/fro/index.dart';

class ClickablePage extends StatefulWidget {
  const ClickablePage({super.key});

  @override
  State<ClickablePage> createState() => _ClickablePageState();
}

class _ClickablePageState extends State<ClickablePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("万能点击组件")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 普通文本（点击透明度发申变化）
            FroClickable(
              child: const Text("点我"),
              onTap: () => FroToast.showToast("点了"),
              onLongPress: (active) =>
                  FroToast.showToast(active ? "长按" : "取消长按"),
            ),
            const SizedBox(height: 20),

            // 色块背景（点击背景颜色透明度发生变化）
            FroClickable(
              color: Colors.redAccent,
              onTap: () => FroToast.showToast("点了"),
              onLongPress: (active) =>
                  FroToast.showToast(active ? "长按" : "取消长按"),
              child: const Text("点我"),
            ),
            const SizedBox(height: 20),

            // 色块背景（点击背景颜色在指定颜色之间切换）
            FroClickable(
              color: Colors.redAccent,
              pressedColor: Colors.greenAccent,
              onTap: () => FroToast.showToast("点了"),
              onLongPress: (active) =>
                  FroToast.showToast(active ? "长按" : "取消长按"),
              child: const Text("点我"),
            ),
            const SizedBox(height: 20),

            // 自定义按钮效果（点击背景颜色和阴影颜色均会发生变化）
            FroClickable(
              builder: (state, child) {
                final pressed = state == WidgetState.pressed;
                final color = pressed ? Colors.greenAccent : Colors.blueAccent;
                return Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(60),
                    boxShadow: [
                      BoxShadow(
                        color: color,
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: child,
                );
              },
              pressedColor: Colors.greenAccent,
              onTap: () => FroToast.showToast("点了"),
              onLongPress: (active) =>
                  FroToast.showToast(active ? "长按" : "取消长按"),
              child: const Text("点我"),
            ),
            const SizedBox(height: 20),

            // 自定义图片背景（点击切换背景图片）
            FroClickable(
              builder: (state, child) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 50,
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: state == WidgetState.pressed
                          ? const AssetImage("assets/images/tb-manager.png")
                          : const AssetImage("assets/images/tb-wap-home.png"),
                    ),
                  ),
                  child: child,
                );
              },
              onTap: () => FroToast.showToast("点了"),
              onLongPress: (active) =>
                  FroToast.showToast(active ? "长按" : "取消长按"),
              child: const Text("点我"),
            ),
            const SizedBox(height: 20),

            // 设置项效果（点击整体透明度发生变化）
            FroClickable(
              color: Colors.white,
              onTap: () => FroToast.showToast("点了"),
              onLongPress: (active) =>
                  FroToast.showToast(active ? "长按" : "取消长按"),
              child: const Padding(
                padding: EdgeInsets.all(15),
                child: Row(children: [Expanded(child: Text("点我"))]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
