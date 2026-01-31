import 'package:field_techy/core/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/client/utils/client_dashboard_routes.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRoutes {
  static final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    routes: [
     /* AuthRoutes.login,
      AuthRoutes.signUp,
      AuthRoutes.signInWithOtp,
      AuthRoutes.forgotPassword,*/
      ShellRoute(
        builder: (context, state, child) {
          return Scaffold(
            appBar: AppBar(
              leading: Row(
                children: [
                  SizedBox(width: 18),
                  AppWidgets.appLogo(context, width: 30, height: 30,),
                ],
              ),
              leadingWidth: 100,
              // title: Text('Client Dashboard'),
            ),
            endDrawer: AppWidgets.appDrawer(context),
            bottomNavigationBar: AppWidgets.bottomNavigationBar(context, currentIndex: 0, onTap: (index) {}),
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
