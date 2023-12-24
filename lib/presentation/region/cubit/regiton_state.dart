import 'package:pokedex_tdk/data/network/dio/failure.dart';
import 'package:pokedex_tdk/domain/models/region.dart';

class RegionState {
  final List<Region> region;
  final bool isLoading;
  final Failure? error;

  RegionState({
    this.region = const [],
    this.isLoading = false,
    this.error,
  });

  RegionState copyWith({
    List<Region>? region,
    bool? isLoading,
    Failure? error,
  }) {
    return RegionState(
      region: region ?? this.region,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}
