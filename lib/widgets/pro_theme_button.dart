import 'package:flutter/material.dart';
import 'package:fro/fro/index.dart';
import 'package:fro/states/index.dart';
import 'package:provider/provider.dart';

class ProThemeButton extends StatelessWidget {
  const ProThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeMode currentMode = context.watch<ThemeState>().themeMode;
    final bool isDark = switch (currentMode) {
      ThemeMode.dark => true,
      ThemeMode.light => false,
      ThemeMode.system => FroHelper.isDarkMode(context),
    };
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(26),
        onTap: () {
          final ThemeMode nextMode = isDark ? ThemeMode.light : ThemeMode.dark;
          context.read<ThemeState>().setThemeMode(nextMode);
        },
        child: Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            shape: BoxShape.circle,
            boxShadow: const [
              BoxShadow(
                color: Color(0x33000000),
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Icon(
            isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
