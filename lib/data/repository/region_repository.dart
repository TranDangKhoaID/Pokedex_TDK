import 'package:injectable/injectable.dart';
import 'package:pokedex_tdk/data/network/core_rest_service.dart';
import 'package:pokedex_tdk/data/network/dio/error_handler.dart';
import 'package:pokedex_tdk/data/network/dio/failure.dart';
import 'package:pokedex_tdk/data/response/region_response.dart';
import 'package:pokedex_tdk/domain/models/region.dart';
import 'package:dartz/dartz.dart';

abstract class RegionRepository {
  Future<Either<Failure, List<Region>>> getRegion({
    bool useCache = false,
  });
}

@LazySingleton(as: RegionRepository)
class RegionRepositoryImpl implements RegionRepository {
  final CoreRestService _restService;

  RegionRepositoryImpl(this._restService);

  @override
  Future<Either<Failure, List<Region>>> getRegion(
      {bool useCache = false}) async {
    try {
      final RegionResponse response = await _restService.getRegion(
        options: null,
      );
      return Right(response.toDomain());
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}
