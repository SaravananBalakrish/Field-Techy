import 'package:field_techy/core/widgets/app_logo.dart';
import 'package:field_techy/core/widgets/gradient_button.dart';
import 'package:field_techy/features/auth/utils/profile_validator.dart';
import 'package:field_techy/features/client/utils/client_dashboard_routes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../utils/auth_routes.dart';

class SignInWithOtpPage extends StatefulWidget {
  const SignInWithOtpPage({super.key});

  @override
  State<SignInWithOtpPage> createState() => _SignInWithOtpPageState();
}

class _SignInWithOtpPageState extends State<SignInWithOtpPage> {
  bool _sendByEmail = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: .stretch,
              mainAxisAlignment: .center,
              children: [
                const AppLogo(),
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
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.push(AuthRoutes.signupPath);
                          },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Text('Send OTP Via *',
                    style: Theme.of(context).textTheme.labelLarge),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile<bool>(
                        title: const Text('Email'),
                        value: true,
                        groupValue: _sendByEmail,
                        onChanged: (value) {
                          setState(() {
                            _sendByEmail = value!;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<bool>(
                        title: const Text('Phone'),
                        value: false,
                        groupValue: _sendByEmail,
                        onChanged: (value) {
                          setState(() {
                            _sendByEmail = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                if(_sendByEmail)...[
                  Text('Email Address *', style: Theme.of(context).textTheme.labelLarge),
                  const SizedBox(height: 8),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Email Address',
                    ),
                    validator: ProfileValidator.validateEmail,
                  ),
                ] else...[
                  Text('Phone Number *', style: Theme.of(context).textTheme.labelLarge),
                  const SizedBox(height: 8),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Enter mobile number',
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text('+91'),
                      ),
                    ),
                    validator: ProfileValidator.validatePhoneNumber,
                  ),
                  ],
                const SizedBox(height: 24),
                GradientButton(
                  text: 'Send OTP',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.push(ClientDashboardRoutes.dashboardPath);
                    }
                  },
                ),
                const SizedBox(height: 16),
                TextButton.icon(
                  onPressed: () {
                    context.pop();
                  },
                  icon: const Icon(Icons.chevron_left),
                  label: const Text('Go Back'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}