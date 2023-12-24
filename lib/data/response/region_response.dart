import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex_tdk/data/response/base_response.dart';
import 'package:pokedex_tdk/domain/models/region.dart';

part 'region_response.g.dart';

@JsonSerializable()
class RegionResponse extends BaseResponse {
  List<Region> results;

  RegionResponse({required this.results});

  factory RegionResponse.fromJson(Map<String, dynamic> json) =>
      _$RegionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegionResponseToJson(this);
}

extension RegionMapper on RegionResponse {
  List<Region> toDomain() {
    List<Region> mapped = (results.map((region) => region.toDomain())).toList();
    return mapped;
  }
}

extension SingleRegionMapper on Region {
  Region toDomain() {
    return Region(
      name: name,
      url: url,
    );
  }
}
