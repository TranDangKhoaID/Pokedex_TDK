import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_tdk/presentation/region/cubit/region_cubit.dart';
import 'package:pokedex_tdk/presentation/region/cubit/regiton_state.dart';

// Import your RegionCubit, RegionState, and related classes

class RegionScreen extends StatelessWidget {
  const RegionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Region List'),
      ),
      body: BlocConsumer<RegionCubit, RegionState>(
        listener: (context, state) {
          // You can handle state changes here if needed
        },
        builder: (context, state) {
          return Center(
            child: state.isLoading
                ? CircularProgressIndicator()
                : state.region.isEmpty
                    ? Text('No regions available.')
                    : ListView.builder(
                        itemCount: state.region.length,
                        itemBuilder: (context, index) {
                          final region = state.region[index];
                          return ListTile(
                            title: Text(region.name),
                            subtitle: Text(region.url),
                          );
                        },
                      ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<RegionCubit>().getRegion();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
