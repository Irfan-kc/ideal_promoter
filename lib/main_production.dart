import 'package:flutter/material.dart';
import 'package:ideal_promoter/config/pre_app_config.dart';

import 'app.dart';
import 'config/flavor_config.dart';
import 'config/network_constants.dart';

Future<void> main() async {
  FlavorConfig.set(
    Flavor.PRODUCTION,
    FlavorValues(
      baseUrlApi: baseUrlProd,
    ),
  );
  await preAppConfig();
  runApp(const App());
}
