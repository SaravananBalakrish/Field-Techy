import 'package:field_techy/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'core/di/injection.dart' as di;
import 'core/flavors/flavor_config.dart';
import 'core/theme/app_theme.dart';

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
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: FlavorConfig.instance.values.displayName,
      theme: AppTheme.lightTheme,
      routerConfig: AppRoutes.router,
    );
  }
}