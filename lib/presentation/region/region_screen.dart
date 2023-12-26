import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_tdk/domain/models/location.dart';

import 'package:pokedex_tdk/presentation/region/component/region_component.dart';
import 'package:pokedex_tdk/presentation/region/cubit/region_cubit.dart';
import 'package:pokedex_tdk/presentation/region/cubit/regiton_state.dart';

// Import your RegionCubit, RegionState, and related classes

class RegionScreen extends StatefulWidget {
  const RegionScreen({super.key});

  @override
  State<RegionScreen> createState() => _RegionScreenState();
}

class _RegionScreenState extends State<RegionScreen> {
  @override
  void initState() {
    context.read<RegionCubit>().getRegion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Region List'),
      ),
      body: BlocProvider<RegionCubit>(
        create: (context) => RegionCubit(),
        child: RegionComponent(),
      ),
    );
  }
}
