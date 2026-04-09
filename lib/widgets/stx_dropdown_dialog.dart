import 'package:flutter/material.dart';

class StxDropdownDialogRoute<T> extends ModalRoute<T> {
  // 触发弹窗的Widget
  final GlobalKey anchorKey;

  // 跟随弹窗Widget到构建方法
  final WidgetBuilder builder;

  StxDropdownDialogRoute({required this.anchorKey, required this.builder});

  // 遮罩颜色，通常用于模态路由，以突出显示前景内容并使背景变暗
  @override
  Color? get barrierColor => Colors.transparent;

  // 遮罩是否可以通过点击来关闭
  @override
  bool get barrierDismissible => true;

  // 无障碍访问提供的描述性字符串标签。
  @override
  String? get barrierLabel => '关闭弹出菜单';

  // 路由在不活动时是否保持其状态。
  @override
  bool get maintainState => true;

  // 定义路由是否不透明，true表示不透明将会覆盖所有内容。
  @override
  bool get opaque => false;

  // 路由过渡动画的持续时间。
  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  // 构建路由的页面内容，返回一个自定义Widget。animation 是主要过渡动画，如页面的缩放、平移、旋转等，secondAnimation 是次要过渡动画，如页面切换时的淡入淡出效果。
  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    Size size = Size.zero;
    Offset offset = const Offset(0, 0);
    RenderObject? renderObject = anchorKey.currentContext!.findRenderObject();
    if (renderObject != null && renderObject is RenderBox) {
      size = renderObject.paintBounds.size;
      offset = renderObject.localToGlobal(Offset.zero);
    }
    offset = Offset(0, offset.dy).translate(0, size.height);

    return Builder(
      builder: (context) {
        return CustomSingleChildLayout(
          delegate: _StxDropdownDialogRouteLayout(offset: offset),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: [
                  SizeTransition(
                    sizeFactor: CurvedAnimation(
                      parent: animation,
                      curve: Curves.easeInOut, // 立方贝塞尔曲线，开始和结束时缓慢，中间加速。
                    ),
                    axisAlignment: -1.0, // 子组件在动画过程的对齐方式，-1.0表示与起点对齐
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: constraints.maxHeight - 100,
                      ),
                      child: builder(context),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      // 💡 透明度动画，通常用于在显示或隐藏组件时提供平滑的过渡效果。
                      child: FadeTransition(
                        opacity: CurvedAnimation(
                          parent: animation,
                          curve: Curves.easeInOut,
                        ),
                        child: Container(color: Colors.black.withOpacity(0.5)),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}

class _StxDropdownDialogRouteLayout extends SingleChildLayoutDelegate {
  final Offset offset;

  _StxDropdownDialogRouteLayout({required this.offset});

  // 对子控件的约束
  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return BoxConstraints(
      maxWidth: constraints.maxWidth,
      maxHeight: constraints.maxHeight - offset.dy,
    );
  }

  // 定义子控件的位置
  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return offset;
  }

  // 是否需要重新布局，当布局委托的状态发生变化时，返回true以触发重新布局。
  @override
  bool shouldRelayout(covariant SingleChildLayoutDelegate oldDelegate) {
    return oldDelegate is _StxDropdownDialogRouteLayout &&
        oldDelegate.offset != offset;
  }
}

Future<T?> showStxDropdownDialog<T>({
  required GlobalKey anchorKey,
  required WidgetBuilder builder,
}) {
  return Navigator.of(
    anchorKey.currentContext!,
  ).push<T>(StxDropdownDialogRoute<T>(anchorKey: anchorKey, builder: builder));
}
