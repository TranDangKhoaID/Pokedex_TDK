import 'package:injectable/injectable.dart';
import 'package:pokedex_tdk/data/network/core_rest_service.dart';
import 'package:pokedex_tdk/data/network/dio/error_handler.dart';
import 'package:pokedex_tdk/data/network/dio/failure.dart';
import 'package:pokedex_tdk/data/response/region_detail_reponse.dart';
import 'package:pokedex_tdk/data/response/region_response.dart';
import 'package:pokedex_tdk/domain/models/location.dart';
import 'package:pokedex_tdk/domain/models/region.dart';
import 'package:dartz/dartz.dart';

abstract class RegionRepository {
  Future<Either<Failure, List<Region>>> getRegion({
    bool useCache = false,
  });

  Future<Either<Failure, List<Location>>> getRegionDetail({
    bool useCache = false,
    required String regionUrl,
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

  @override
  Future<Either<Failure, List<Location>>> getRegionDetail({
    bool useCache = false,
    required String regionUrl,
  }) async {
    try {
      final regionId = extractRegionIdFromUrl(regionUrl);
      final RegionDetailResponse response = await _restService.getRegionDetail(
        regionId,
        options: null,
      );
      return Right(response.toDomain());
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  int extractRegionIdFromUrl(String regionUrl) {
    final RegExp regex = RegExp(r'/(\d+)/$');
    final Match? match = regex.firstMatch(regionUrl);

    if (match != null) {
      final String matchedNumber = match.group(1) ?? '0';
      return int.tryParse(matchedNumber) ?? 0;
    }

    return 0;
  }
}
