import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/utils/auth_routes.dart';
import '../../features/client/utils/client_dashboard_routes.dart';
import '../widgets/app_drawer.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRoutes {
  static final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    routes: [
      AuthRoutes.login,
      AuthRoutes.signUp,
      AuthRoutes.signInWithOtp,
      AuthRoutes.forgotPassword,
      ShellRoute(
        builder: (context, state, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Client Dashboard'),
            ),
            drawer: const AppDrawer(),
            body: child,
          );
        },
        routes: [
          ClientDashboardRoutes.dashboard,
        ],
      ),
    ],
  );
}
