import 'package:go_router/go_router.dart';

import '../presentation/pages/profile_setup_page.dart';
import '../presentation/pages/login_page.dart';

class AuthRoutes {
  static const loginRouteName = 'login';
  static const loginPath = '/';

  static const signupRouteName = 'signup';
  static const signupPath = '/signup';

  static final login = GoRoute(
    name: loginRouteName,
    path: loginPath,
    builder: (context, state) => const LoginPage(),
  );

  static final signUp = GoRoute(
    name: signupRouteName,
    path: signupPath,
    builder: (context, state) => const ProfileSetupPage(),
  );
}
