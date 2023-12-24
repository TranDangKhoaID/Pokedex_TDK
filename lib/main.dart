import 'package:flutter/material.dart';
import 'package:pokedex_tdk/app/app.dart';
import 'package:pokedex_tdk/app/config/flavor.dart';
import 'package:pokedex_tdk/app/di/di.dart';

void main() async {
  setFlavorDevelopment();
  await DependencyInjection.init();
  runApp(const App());
}
