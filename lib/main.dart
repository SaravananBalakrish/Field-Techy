import 'package:flutter/material.dart';
import 'core/di/injection.dart' as di;
import 'core/flavors/flavor_config.dart';

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
      title: FlavorConfig.instance.values.displayName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(FlavorConfig.instance.values.displayName),
      ),
      body: Center(
        child: Text(
          'This is ${FlavorConfig.instance.values.displayName}',
        ),
      ),
    );
  }
}
