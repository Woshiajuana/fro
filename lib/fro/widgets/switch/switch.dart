import 'package:flutter/material.dart';

class FroSwitch extends StatefulWidget {
  const FroSwitch({
    super.key,
    required this.value,
    this.onChange,
    this.onChanged,
    this.activeColor,
    this.inactiveColor,
    this.future,
  }) : assert(
         onChange != null || onChanged != null,
         'onChange 或 onChanged 至少传一个',
       );

  /// 值
  final bool value;

  /// 值改变时调用
  final ValueChanged<bool>? onChange;

  /// 值改变时调用（Flutter 命名风格）
  final ValueChanged<bool>? onChanged;

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
  late bool _value;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  void didUpdateWidget(covariant FroSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value && !_loading) {
      _value = widget.value;
    }
  }

  void _emitChange(bool value) {
    widget.onChange?.call(value);
    widget.onChanged?.call(value);
  }

  Future<void> _handleChange(bool nextValue) async {
    if (_loading) {
      return;
    }
    if (widget.future == null) {
      setState(() {
        _value = nextValue;
      });
      _emitChange(nextValue);
      return;
    }

    setState(() {
      // _value = nextValue;
      _loading = true;
    });

    try {
      final bool result = await widget.future!(nextValue);
      if (!mounted) {
        return;
      }
      setState(() {
        _value = result;
        _loading = false;
      });
      _emitChange(result);
    } catch (_) {
      if (!mounted) {
        return;
      }
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color activeColor = widget.activeColor ?? const Color(0xFF1989FA);
    final Color inactiveColor = widget.inactiveColor ?? const Color(0xFFDCDCDC);
    final Color trackColor = _value ? activeColor : inactiveColor;
    final Alignment thumbAlignment = _value
        ? Alignment.centerRight
        : Alignment.centerLeft;

    return GestureDetector(
      onTap: _loading ? null : () => _handleChange(!_value),
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        width: 52,
        height: 32,
        padding: const EdgeInsets.all(3),
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
