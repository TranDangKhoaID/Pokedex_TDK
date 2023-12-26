import 'package:pokedex_tdk/data/network/dio/failure.dart';
import 'package:pokedex_tdk/domain/models/location.dart';
import 'package:pokedex_tdk/domain/models/region.dart';

class RegionState {
  final List<Region> region;
  final List<Location> location;
  final bool isLoading;
  final Failure? error;

  RegionState({
    this.region = const [],
    this.location = const [],
    this.isLoading = false,
    this.error,
  });

  RegionState copyWith({
    List<Region>? region,
    List<Location>? location,
    bool? isLoading,
    Failure? error,
  }) {
    return RegionState(
      region: region ?? this.region,
      location: location ?? this.location,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}
