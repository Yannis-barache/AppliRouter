import 'package:GoRouterExample/Notifier/loginNotifier.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:GoRouterExample/navbar.dart';
import 'package:GoRouterExample/pages.dart';
import 'package:provider/provider.dart';
import 'aboutPage.dart';
import 'app.dart';

final GlobalKey<NavigatorState> _goRouterKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellRouteKey = GlobalKey<NavigatorState>();

class AppRouter {
  final loginNotifier loginInfo;
  AppRouter({required this.loginInfo});
  get router => _router;

  late final GoRouter _router = GoRouter(
    initialLocation: '/',
    navigatorKey: _goRouterKey,
    refreshListenable: loginInfo,

    redirect: (context, state) {
      final bool loggedInfo = loginInfo.loggedIn;
      if(!loggedInfo) {
        return '/login';
      }
      return null; // signifie la route par défaut que l'on a demandé
    },
    routes: <RouteBase>[
      ShellRoute(
        navigatorKey: _shellRouteKey,
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return ScaffoldNavBar(child: child);
        },
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) {
              return const HomePage();
            },
          ),
          GoRoute(
            path: '/about',
            builder: (context, state) {
              return const AboutPage();
            },
          ),
          GoRoute(
            path: '/page/:label',
            builder: (context, state) {
              return LabelPage(label: state.pathParameters['label']);
            },
            routes: [
              GoRoute(
                path: 'details/:id',
                parentNavigatorKey: _goRouterKey,
                builder: (context, state) {
                  return DetailsScreen(id: state.pathParameters['id']);
                },
              ),
            ],
          ),
        ],
      ),
      GoRoute(path: '/login', builder: (context, state) {
        return const LoginPage();
      }),
    ],
  );
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.read<loginNotifier>().login("Rebson");
          },
          child: const Text('Login'),
        ),
      ),
    );
  }
}