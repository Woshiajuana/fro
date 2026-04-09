import 'package:flutter/material.dart';

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
    final value = widget.value;

    final Color activeColor = widget.activeColor ?? const Color(0xFF1989FA);
    final Color inactiveColor = widget.inactiveColor ?? const Color(0xFFDCDCDC);
    final Color trackColor = value ? activeColor : inactiveColor;
    final Alignment thumbAlignment = value
        ? Alignment.centerRight
        : Alignment.centerLeft;

    return GestureDetector(
      onTap: _handleSwitch,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        width: 52,
        height: 32,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: trackColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          alignment: thumbAlignment,
          child: Container(
            width: 26,
            height: 26,
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
                      valueColor: AlwaysStoppedAnimation<Color>(activeColor),
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
