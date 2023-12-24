// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegionResponse _$RegionResponseFromJson(Map<String, dynamic> json) =>
    RegionResponse(
      results: (json['results'] as List<dynamic>)
          .map((e) => Region.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..success = json['success'] as bool?;

Map<String, dynamic> _$RegionResponseToJson(RegionResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'results': instance.results,
    };
