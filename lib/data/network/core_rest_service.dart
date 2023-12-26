import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex_tdk/data/response/region_detail_reponse.dart';
import 'package:pokedex_tdk/data/response/region_response.dart';
import 'package:retrofit/retrofit.dart';

part 'core_rest_service.g.dart';

@lazySingleton
@RestApi()
abstract class CoreRestService {
  @factoryMethod
  factory CoreRestService(Dio dio) = _CoreRestService;

  @GET("/v2/region")
  Future<RegionResponse> getRegion({
    @DioOptions() required Options? options,
  });

  @GET("/v2/region/{regionId}")
  Future<RegionDetailResponse> getRegionDetail(
    @Path("regionId") int regionId, {
    @DioOptions() required Options? options,
  });
}
