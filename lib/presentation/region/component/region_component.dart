import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_tdk/presentation/region/cubit/region_cubit.dart';
import 'package:pokedex_tdk/presentation/region/cubit/regiton_state.dart';

class RegionComponent extends StatefulWidget {
  const RegionComponent({
    super.key,
  });

  @override
  State<RegionComponent> createState() => _RegionComponentState();
}

class _RegionComponentState extends State<RegionComponent> {
  @override
  void initState() {
    context.read<RegionCubit>().getRegion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegionCubit, RegionState>(
      builder: (context, state) {
        return state.isLoading
            ? const Center(child: CircularProgressIndicator())
            : state.region.isEmpty
                ? const Center(child: Text('No data available.'))
                : GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0,
                    ),
                    itemCount: state.region.length,
                    itemBuilder: (context, index) {
                      final region = state.region[index];
                      return GestureDetector(
                        onTap: () {
                          context.read<RegionCubit>().getLocationRegion(
                                regionUrl: region.url,
                              );
                          showBottomSheet(
                            context: context,
                            builder: (context) {
                              return ListView.builder(
                                itemCount: state.location.length,
                                itemBuilder: (context, index) {
                                  final location = state.location[index];
                                  return locationWidget(location);
                                },
                              );
                            },
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.deepOrange,
                          ),
                          padding: EdgeInsets.all(15),
                          alignment: Alignment.center,
                          child: Text(
                            region.name.toUpperCase(),
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      );
                    },
                  );
      },
    );
  }

  Widget locationWidget(location) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            location.name.toUpperCase(),
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
