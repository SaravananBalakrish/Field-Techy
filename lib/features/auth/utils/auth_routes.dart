import 'package:go_router/go_router.dart';

import '../presentation/pages/login_page.dart';

class AuthRoutes {
  static const loginRouteName = 'login';
  static const loginPath = '/';
  static final login = GoRoute(
    name: loginRouteName,
    path: loginPath,
    builder: (context, state) => const LoginPage(),
  );
}
