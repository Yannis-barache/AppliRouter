
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
        child: ElevatedButton(
          onPressed: () {
            GoRouter.of(context).go('/page/'+(label ?? 'A') +'/details/'+(label ?? 'A'));
          }, child: Text('Details '+ (label ?? 'A')
        ),
      ),
    ),
    );
  }
}