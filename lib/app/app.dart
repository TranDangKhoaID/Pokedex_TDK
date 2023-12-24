import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_tdk/app/helpers/device_helper.dart';
import 'package:pokedex_tdk/presentation/region/cubit/region_cubit.dart';
import 'package:pokedex_tdk/presentation/region/region_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScreen();
  }
}

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex TDK',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => RegionCubit(),
        child: RegionScreen(),
      ),
    );
  }
}
