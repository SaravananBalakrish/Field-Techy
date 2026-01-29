import 'package:flutter/material.dart';
import 'core/di/injection.dart' as di;
import 'core/flavors/flavor_config.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/presentation/pages/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlavorConfig.setupFromDartDefine();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: FlavorConfig.instance.values.displayName,
      theme: AppTheme.lightTheme,
      home: const LoginPage(),
    );
  }
}