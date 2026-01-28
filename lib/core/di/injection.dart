import 'package:get_it/get_it.dart';

import '../flavors/flavor_di.dart';


final GetIt sl = GetIt.instance;

Future<void> init() async {
  registerFlavorDependencies();
}