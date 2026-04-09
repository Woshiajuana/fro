import 'package:flutter/material.dart';
import 'package:fro/router/app_router.dart';
import 'package:go_router/go_router.dart';
import 'package:fro/fro/index.dart';

class PlaygroundPage extends StatelessWidget {
  const PlaygroundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('演练场')),
      body: GridView.count(
        crossAxisCount: 3,
        padding: const EdgeInsets.all(10),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: [
          ...AppRouter.demoRoutes
              .where((route) => route.title != null)
              .map(
                (route) => FroClickable(
                  onTap: () => context.push(route.path),
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(route.icon, size: 32),
                      const SizedBox(height: 10),
                      Text(route.title ?? ''),
                    ],
                  ),
                ),
              ),
        ],
      ),
    );
  }
}
