import 'package:field_techy/features/auth/presentation/pages/sign_in_with_otp_page.dart';
import 'package:go_router/go_router.dart';

import '../presentation/pages/forgot_password_page.dart';
import '../presentation/pages/profile_setup_page.dart';
import '../presentation/pages/login_page.dart';

class AuthRoutes {
  static const loginRouteName = 'login';
  static const loginPath = '/';

  static const signupRouteName = 'signup';
  static const signupPath = '/$signupRouteName';

  static const signInWithOtpRouteName = 'signInWithOtp';
  static const signInWithOtpPath = '/$signInWithOtpRouteName';

  static const forgotPasswordRouteName = 'forgotPassword';
  static const forgotPasswordPath = '/$forgotPasswordRouteName';


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

  static final signInWithOtp = GoRoute(
    name: signInWithOtpRouteName,
    path: signInWithOtpPath,
    builder: (context, state) => const SignInWithOtpPage(),
  );

  static final forgotPassword = GoRoute(
    name: forgotPasswordRouteName,
    path: forgotPasswordPath,
    builder: (context, state) => const ForgotPasswordPage(),
  );
}
