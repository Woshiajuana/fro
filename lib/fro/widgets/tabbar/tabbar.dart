import 'package:flutter/material.dart';
import 'package:fro/fro/widgets/tabbar/tabbar_item.dart';

class FroTabbar extends StatelessWidget {
  const FroTabbar({
    required this.items,
    required this.currentIndex,
    this.onTap,
    this.height = 56,
    this.backgroundColor = Colors.white,
    this.activeColor = const Color(0xFF1989FA),
    this.inactiveColor = const Color(0xFF646566),
    this.borderColor = const Color(0xFFF2F3F5),
    super.key,
  });

  final List<FroTabbarItem> items;
  final int currentIndex;
  final ValueChanged<int>? onTap;
  final double height;
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border(top: BorderSide(color: borderColor)),
      ),
      child: SizedBox(
        height: height,
        child: Row(
          children: List.generate(
            items.length,
            (index) => _FroTabbarButton(
              icon: items[index].icon,
              activeIcon: items[index].activeIcon,
              text: items[index].text,
              dot: items[index].dot,
              badge: items[index].badge,
              active: currentIndex == index,
              activeColor: activeColor,
              inactiveColor: inactiveColor,
              onTap: () => onTap?.call(index),
            ),
          ),
        ),
      ),
    );
  }
}

class _FroTabbarButton extends StatelessWidget {
  const _FroTabbarButton({
    required this.icon,
    required this.activeIcon,
    required this.text,
    required this.active,
    this.dot = false,
    this.badge,
    this.onTap,
    this.activeColor = const Color(0xFF1989FA),
    this.inactiveColor = const Color(0xFF646566),
  });

  final Widget icon;
  final Widget activeIcon;
  final String text;
  final bool active;
  final bool dot;
  final String? badge;
  final VoidCallback? onTap;
  final Color activeColor;
  final Color inactiveColor;

  @override
  Widget build(BuildContext context) {
    final String? normalizedBadge = badge?.trim();
    final bool showBadge =
        normalizedBadge != null && normalizedBadge.isNotEmpty;

    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 56,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  IconTheme(
                    data: IconThemeData(
                      size: 24,
                      color: active ? activeColor : inactiveColor,
                    ),
                    child: active ? activeIcon : icon,
                  ),
                  if (showBadge)
                    Positioned(
                      right: -12,
                      top: -6,
                      child: Container(
                        constraints: const BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: const BoxDecoration(
                          color: Color(0xFFEE0A24),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          normalizedBadge,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            height: 1.1,
                          ),
                        ),
                      ),
                    )
                  else if (dot)
                    const Positioned(
                      right: -2,
                      top: -2,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Color(0xFFEE0A24),
                          shape: BoxShape.circle,
                        ),
                        child: SizedBox(width: 8, height: 8),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 3),
              Text(
                text,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: active ? activeColor : inactiveColor,
                  fontSize: 12,
                  height: 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
