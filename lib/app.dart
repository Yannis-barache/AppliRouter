import 'package:GoRouterExample/Notifier/loginNotifier.dart';
import 'package:flutter/material.dart';
import 'router.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget
{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => loginNotifier()),
        ProxyProvider<loginNotifier, AppRouter>(
          update: (context, loginInfo, previous) => AppRouter(loginInfo : loginInfo),
        ),
      ],
      child: Builder(
        builder: (context) {
          final router = Provider.of<AppRouter>(context).router;
          return MaterialApp.router(
            title: 'GoRouter Example',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            routerConfig: router,
          );
        },
      ),
    );
  }
}


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accueil'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go('/about'),
          child: const Text('Go to the Details screen'),
        ),
      ),
    );
  }
}

/// The details screen
class DetailsScreen extends StatelessWidget {
  final String? id;

  /// Constructs a [DetailsScreen]
  const DetailsScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details Screen ' + (id ?? ''))),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go('/'),
          child: const Text('Go back to the Home screen'),
        ),
      ),
    );
  }
}
