import 'package:field_techy/core/widgets/app_widgets.dart';
import 'package:field_techy/features/auth/utils/profile_validator.dart';
import 'package:field_techy/features/client/utils/client_dashboard_routes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../utils/auth_routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(25),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: .stretch,
                mainAxisAlignment: .center,
                children: [
                  AppWidgets.appLogo(context),
                  const SizedBox(height: 24),
                  Text(
                    'Sign In',
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: [
                        const TextSpan(text: "Don't have an account? "),
                        TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {
                            context.push(AuthRoutes.signupPath);
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text('Email Address *', style: Theme.of(context).textTheme.labelLarge),
                  const SizedBox(height: 8),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Email Address',
                    ),
                    validator: ProfileValidator.validateEmail,
                  ),
                  const SizedBox(height: 16),
                  Text('Password *', style: Theme.of(context).textTheme.labelLarge),
                  const SizedBox(height: 8),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      suffixIcon: Icon(Icons.visibility),
                    ),
                    validator: ProfileValidator.validatePassword,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(value: false, onChanged: (value) {}),
                          const Text('Remember Me'),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          context.push(AuthRoutes.forgotPasswordPath);
                        },
                        child: const Text('Forgot Password?'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  AppWidgets.gradientButton(
                    context,
                    text: 'Submit',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.push(ClientDashboardRoutes.dashboardPath);
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  TextButton.icon(
                    onPressed: () {
                      context.push(AuthRoutes.signInWithOtpPath);
                    },
                    icon: const Icon(Icons.mail_outline),
                    label: const Text('Sign In with OTP'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
