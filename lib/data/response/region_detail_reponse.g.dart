// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region_detail_reponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegionDetailResponse _$RegionDetailResponseFromJson(
        Map<String, dynamic> json) =>
    RegionDetailResponse(
      id: json['id'] as int,
      locations: (json['locations'] as List<dynamic>)
          .map((e) => Location.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..success = json['success'] as bool?;

Map<String, dynamic> _$RegionDetailResponseToJson(
        RegionDetailResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'id': instance.id,
      'locations': instance.locations,
    };
