// ignore_for_file: constant_identifier_names, avoid_print


import 'package:ideal_promoter/utils/enum_utils.dart';

enum Flavor { DEV, PRODUCTION }

class FlavorValues {
  final String baseUrlApi;

  FlavorValues({
    required this.baseUrlApi,
  });
}

abstract class FlavorConfig {
  static Flavor? _flavor;
  static String? _flavorName;
  static FlavorValues? _values;

  static void set(Flavor flavor, FlavorValues values) {
    _flavor = flavor;
    _flavorName = enumToString(flavor);
    _values = values;
    print(_flavorName == "PRODUCTION"
        ? "Running in Production mode 🚀"
        : "Running in Development mode 🤖");
  }

  static bool isInitialized() => _flavor != null;

  static bool isDev() => _flavor! == Flavor.DEV;

  static bool isProduction() => _flavor! == Flavor.PRODUCTION;

  static String get flavorName => _flavorName!;

  static FlavorValues get values => _values!;
}
