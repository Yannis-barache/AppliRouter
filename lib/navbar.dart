import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldNavBar extends StatelessWidget {
  final Widget child;
  final ValueNotifier<int> _selectedIndex = ValueNotifier<int>(0);
  late BuildContext context;

  ScaffoldNavBar({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return ValueListenableBuilder<int>(
      valueListenable: _selectedIndex,
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Scaffold NavBar'),
          ),
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Page A',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Page B',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'Page C',
              ),
            ],
            currentIndex: value,
            onTap: onItemTapped,
          ),
        );
      },
      child: child,
    );
  }

  void onItemTapped(int index) {
    _selectedIndex.value = index;
    if (index == 0) {
      GoRouter.of(context).go('/page/A');
    } else if (index == 1) {
      GoRouter.of(context).go('/page/B');
    } else if (index == 2) {
      GoRouter.of(context).go('/page/C');
    }
  }
}