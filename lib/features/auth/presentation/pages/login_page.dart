
import 'package:field_techy/core/widgets/app_logo.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const AppLogo(),
              const SizedBox(height: 24),
              Text(
                'Sign In',
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Don\'t have an account? Sign Up',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              const Text('Email Address *'),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Email Address',
                ),
              ),
              const SizedBox(height: 16),
              const Text('Password *'),
              const SizedBox(height: 8),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Password',
                  suffixIcon: Icon(Icons.visibility),
                ),
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
                    onPressed: () {},
                    child: const Text('Forgot Password?'),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Submit'),
              ),
              const SizedBox(height: 16),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.mail),
                label: const Text('Sign In with OTP'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
