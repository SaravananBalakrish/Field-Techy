import 'package:flutter/foundation.dart';

enum Flavor { dev, staging, prod }

class FlavorValues {
  final String displayName;
  final String apiBaseUrl;

  const FlavorValues({
    required this.displayName,
    required this.apiBaseUrl,
  });
}

class FlavorConfig {
  final Flavor flavor;
  final FlavorValues values;
  static late FlavorConfig _instance;

  FlavorConfig._internal({required this.flavor, required this.values}) {
    _instance = this;
  }

  static FlavorConfig get instance {
    try {
      return _instance;
    } catch (e) {
      throw StateError(
          'FlavorConfig is not initialized. Call FlavorConfig.setup(...) before accessing FlavorConfig.instance.');
    }
  }

  static void setup(Flavor flavor, {FlavorValues? overrideValues}) {
    final values = overrideValues ?? _defaultValuesFor(flavor);
    FlavorConfig._internal(flavor: flavor, values: values);
    if (kDebugMode) {
      debugPrint('FlavorConfig.setup -> ${values.displayName}');
    }
  }

  static void setupFromDartDefine() {
    const raw = String.fromEnvironment('FLAVOR', defaultValue: '');
    final f = _fromString(raw) ?? Flavor.dev;
    setup(f);
  }

  static FlavorValues _defaultValuesFor(Flavor flavor) {
    switch (flavor) {
      case Flavor.dev:
        return const FlavorValues(
          displayName: 'Development',
          apiBaseUrl: 'https://dev-api.example.com',
        );
      case Flavor.prod:
        return const FlavorValues(
          displayName: 'Production',
          apiBaseUrl: 'https://api.example.com',
        );
      case Flavor.staging:
        return const FlavorValues(
          displayName: 'Staging',
          apiBaseUrl: 'https://staging-api.example.com',
        );
    }
  }

  static Flavor? _fromString(String raw) {
    final s = raw.trim().toLowerCase();
    if (s.isEmpty) return null;
    if (s == 'development' || s == 'dev' || s == 'deve') return Flavor.dev;
    if (s == 'production' || s == 'prod' || s == 'pro') return Flavor.prod;
    if (s == 'staging' || s == 'stage') return Flavor.staging;
    return null;
  }

  bool get isDev => flavor == Flavor.dev;
  bool get isStaging => flavor == Flavor.staging;
  bool get isProd => flavor == Flavor.prod;

  @override
  String toString() => 'FlavorConfig(flavor: $flavor)';
}
