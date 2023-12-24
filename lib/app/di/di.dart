import 'package:flutter/material.dart';
import 'package:pokedex_tdk/app/di/get_it.dart';

class DependencyInjection {
  static Future<void> init() async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    await initDependencyInjection();
  }
}
