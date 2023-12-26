import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_tdk/app/di/get_it.dart';
import 'package:pokedex_tdk/data/network/dio/failure.dart';
import 'package:pokedex_tdk/data/repository/region_repository.dart';
import 'package:pokedex_tdk/domain/models/location.dart';
import 'package:pokedex_tdk/domain/models/region.dart';
import 'package:pokedex_tdk/presentation/region/cubit/regiton_state.dart';

class RegionCubit extends Cubit<RegionState> {
  RegionCubit() : super(RegionState());

  final RegionRepository _regionRepository = getIt<RegionRepository>();
  Future<void> getRegion() async {
    emit(state.copyWith(isLoading: true));

    final result = await _regionRepository.getRegion(useCache: true);
    // final resultLocation = await _regionRepository.getRegionDetail(
    //   useCache: true,
    //   regionUrl: 'https://pokeapi.co/api/v2/region/1/',
    // );

    result.fold(
      (Failure failure) {
        emit(state.copyWith(isLoading: false, error: failure));
      },
      (List<Region> data) {
        emit(state.copyWith(isLoading: false, region: data, error: null));
      },
    );
  }

  Future<void> getLocationRegion({
    required regionUrl,
  }) async {
    emit(state.copyWith(isLoading: true));

    final result = await _regionRepository.getRegionDetail(
      useCache: true,
      regionUrl: regionUrl,
    );

    result.fold(
      (Failure failure) {
        emit(state.copyWith(isLoading: false, error: failure));
      },
      (List<Location> data) {
        emit(state.copyWith(isLoading: false, location: data, error: null));
      },
    );
  }
}
