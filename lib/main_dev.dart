import 'package:flutter/material.dart';
import 'package:ideal_promoter/config/pre_app_config.dart';

import 'app.dart';
import 'config/flavor_config.dart';
import 'config/network_constants.dart';

Future<void> main() async {
  FlavorConfig.set(
    Flavor.DEV,
    FlavorValues(
      baseUrlApi: baseUrlDev,
    ),
  );
  await preAppConfig();
  runApp(const App());
}
