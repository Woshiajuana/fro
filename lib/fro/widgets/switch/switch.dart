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
    final brightness = Theme.of(context).brightness;
    final defaultTheme = FroSwitchThemeData.fallback(brightness);
    final switchTheme = FroSwitchTheme.of(context);

    final value = widget.value;

    final Color activeColor =
        widget.activeColor ??
        switchTheme.activeColor ??
        defaultTheme.activeColor ??
        const Color(0xFF1989FA);
    final Color inactiveColor =
        widget.inactiveColor ??
        switchTheme.inactiveColor ??
        defaultTheme.inactiveColor ??
        const Color(0xFFDCDCDC);
    final Color trackColor = value ? activeColor : inactiveColor;
    final Alignment thumbAlignment = value
        ? Alignment.centerRight
        : Alignment.centerLeft;
    final double width = switchTheme.width ?? defaultTheme.width ?? 52;
    final double height = switchTheme.height ?? defaultTheme.height ?? 32;
    final double padding = switchTheme.padding ?? defaultTheme.padding ?? 4;
    final double thumbSize =
        switchTheme.thumbSize ??
        defaultTheme.thumbSize ??
        (height - padding * 2);
    final Duration animationDuration =
        switchTheme.animationDuration ??
        defaultTheme.animationDuration ??
        const Duration(milliseconds: 180);
    final Color loadingIndicatorColor =
        switchTheme.loadingIndicatorColor ??
        defaultTheme.loadingIndicatorColor ??
        const Color(0xFF1989FA);

    return GestureDetector(
      onTap: _handleSwitch,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: animationDuration,
        curve: Curves.easeOut,
        width: width,
        height: height,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          color: trackColor,
          borderRadius: BorderRadius.circular(height / 2),
        ),
        child: AnimatedAlign(
          duration: animationDuration,
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
                        loadingIndicatorColor,
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
