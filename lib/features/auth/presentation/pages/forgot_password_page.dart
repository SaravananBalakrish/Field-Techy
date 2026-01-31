import 'package:field_techy/core/widgets/app_widgets.dart';
import 'package:field_techy/features/auth/utils/profile_validator.dart';
import 'package:field_techy/features/client/utils/client_dashboard_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
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
                  'Forgot Password',
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodyMedium,
                    children: [
                      const TextSpan(text: "Enter your email address to reset your password."),
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
                const SizedBox(height: 24),
                AppWidgets.gradientButton(
                  context,
                  text: 'Submit',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      context.push(ClientDashboardRoutes.dashboardPath);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
