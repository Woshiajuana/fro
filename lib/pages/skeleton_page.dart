import 'package:flutter/material.dart';

class SkeletonPage extends StatelessWidget {
  const SkeletonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('骨架屏')),
      body: Center(child: Column(children: [
            
          ],
        )),
    );
  }
}
