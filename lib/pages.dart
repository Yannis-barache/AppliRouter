
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'Notifier/loginNotifier.dart';

class LabelPage extends StatelessWidget {
  final label;

  const LabelPage({Key? key, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page '+(label ?? '')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.go('/page/'+(label ?? '')+'/details/1'),
              child: const Text('Go to the Details screen 1'),
            ),
            ElevatedButton(
              onPressed: () => context.go('/page/'+(label ?? '')+'/details/2'),
              child: const Text('Go to the Details screen 2'),
            ),
            ElevatedButton(onPressed: () => context.read<loginNotifier>().logout(), child: const Text('logout') ,)
          ],
      ),
    ),
    );
  }
}