import 'package:flutter/material.dart';

import 'core/di/injection.dart' as di;
import 'core/flavors/flavor_config.dart';
import 'main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlavorConfig.setup(Flavor.staging);
  await di.init();
  runApp(const MyApp());
}
