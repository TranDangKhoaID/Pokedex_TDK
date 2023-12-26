import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex_tdk/data/response/base_response.dart';
import 'package:pokedex_tdk/domain/models/location.dart';

part 'region_detail_reponse.g.dart';

@JsonSerializable()
class RegionDetailResponse extends BaseResponse {
  final int id;
  final List<Location> locations;

  RegionDetailResponse({required this.id, required this.locations});

  factory RegionDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$RegionDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegionDetailResponseToJson(this);
}

extension LocationMapper on Location {
  Location toDomain() {
    return Location(
      name: name,
      url: url,
    );
  }
}

extension RegionDetailMapper on RegionDetailResponse {
  List<Location> toDomain() {
    List<Location> mapped =
        locations.map((location) => location.toDomain()).toList();
    return mapped;
  }
}
