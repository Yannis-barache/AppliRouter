import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/navbar.dart';
import 'aboutPage.dart';
import 'app.dart';

final GlobalKey<NavigatorState> _goRouterKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellRouteKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: '/',
  navigatorKey: _goRouterKey,
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
          path: '/details/:id',
          builder: (context, state) {
            return DetailsScreen(id: state.pathParameters['id']);
          },
        ),
      ],
    ),
  ],
);