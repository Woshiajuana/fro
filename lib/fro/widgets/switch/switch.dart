import 'package:flutter/material.dart';
import 'switch_theme.dart';

class FroSwitch extends StatefulWidget {
  const FroSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.activeColor,
    this.inactiveColor,
    this.future,
  });

  /// 值
  final bool value;

  /// 值改变时调用
  final ValueChanged<bool> onChanged;

  /// 颜色
  final Color? activeColor;

  /// 颜色
  final Color? inactiveColor;

  /// 异步任务
  final Future<bool> Function(bool nextValue)? future;

  @override
  State<FroSwitch> createState() => _FroSwitchState();
}

class _FroSwitchState extends State<FroSwitch> {
  bool _loading = false;

  Future<void> _handleSwitch() async {
    if (_loading) {
      return;
    }

    bool value = !widget.value;
    try {
      if (widget.future != null) {
        setState(() {
          _loading = true;
        });
        value = await widget.future!(value);
      }
      if (mounted) {
        widget.onChanged.call(value);
      }
    } finally {
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final switchTheme = FroSwitchTheme.of(context);

    final value = widget.value;

    final Color activeColor = widget.activeColor ?? switchTheme.activeColor;
    final Color inactiveColor =
        widget.inactiveColor ?? switchTheme.inactiveColor;
    final Color trackColor = value ? activeColor : inactiveColor;
    final Alignment thumbAlignment = value
        ? Alignment.centerRight
        : Alignment.centerLeft;

    // 滑块大小
    final thumbSize = switchTheme.height - switchTheme.padding * 2;

    return GestureDetector(
      onTap: _handleSwitch,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: switchTheme.animationDuration,
        curve: Curves.easeOut,
        width: switchTheme.width,
        height: switchTheme.height,
        padding: EdgeInsets.all(switchTheme.padding),
        decoration: BoxDecoration(
          color: trackColor,
          borderRadius: BorderRadius.circular(switchTheme.height / 2),
        ),
        child: AnimatedAlign(
          duration: switchTheme.animationDuration,
          curve: Curves.easeOut,
          alignment: thumbAlignment,
          child: Container(
            width: thumbSize,
            height: thumbSize,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: _loading
                ? SizedBox(
                    width: 14,
                    height: 14,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        switchTheme.loadingIndicatorColor,
                      ),
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
