import '../di/injection.dart';
import '../services/api_client.dart';
import 'flavor_config.dart';

abstract class ExampleService {
  String get info;
}

class ExampleServiceImpl implements ExampleService {
  final String flavorName;
  ExampleServiceImpl(this.flavorName);
  @override
  String get info => 'Service for $flavorName';
}

void registerFlavorDependencies() {
  final flavor = FlavorConfig.instance;

  sl.registerLazySingleton<ExampleService>(() => ExampleServiceImpl(flavor.values.displayName));

  // --------------------------
  // Flavor-aware ApiClient
  // --------------------------
  if (!sl.isRegistered<ApiClient>()) {
    sl.registerLazySingleton<ApiClient>(() => ApiClient(
      baseUrl: flavor.values.apiBaseUrl,
    ));
  }
}