// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geocode_reverse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeocodeReverseModel _$GeocodeReverseModelFromJson(Map<String, dynamic> json) =>
    GeocodeReverseModel(
      plusCode: json['plus_code'] == null
          ? null
          : PlusCode.fromJson(json['plus_code'] as Map<String, dynamic>),
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Results.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$GeocodeReverseModelToJson(
        GeocodeReverseModel instance) =>
    <String, dynamic>{
      'plus_code': instance.plusCode,
      'results': instance.results,
      'status': instance.status,
    };

PlusCode _$PlusCodeFromJson(Map<String, dynamic> json) => PlusCode(
      compoundCode: json['compound_code'] as String?,
      globalCode: json['global_code'] as String?,
    );

Map<String, dynamic> _$PlusCodeToJson(PlusCode instance) => <String, dynamic>{
      'compound_code': instance.compoundCode,
      'global_code': instance.globalCode,
    };

Results _$ResultsFromJson(Map<String, dynamic> json) => Results(
      addressComponents: (json['address_components'] as List<dynamic>?)
          ?.map((e) => AddressComponents.fromJson(e as Map<String, dynamic>))
          .toList(),
      formattedAddress: json['formatted_address'] as String?,
      geometry: json['geometry'] == null
          ? null
          : Geometry.fromJson(json['geometry'] as Map<String, dynamic>),
      placeId: json['place_id'] as String?,
      plusCode: json['plus_code'] == null
          ? null
          : PlusCode.fromJson(json['plus_code'] as Map<String, dynamic>),
      types:
          (json['types'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ResultsToJson(Results instance) => <String, dynamic>{
      'address_components': instance.addressComponents,
      'formatted_address': instance.formattedAddress,
      'geometry': instance.geometry,
      'place_id': instance.placeId,
      'plus_code': instance.plusCode,
      'types': instance.types,
    };

AddressComponents _$AddressComponentsFromJson(Map<String, dynamic> json) =>
    AddressComponents(
      longName: json['long_name'] as String?,
      shortName: json['short_name'] as String?,
      types:
          (json['types'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$AddressComponentsToJson(AddressComponents instance) =>
    <String, dynamic>{
      'long_name': instance.longName,
      'short_name': instance.shortName,
      'types': instance.types,
    };

Geometry _$GeometryFromJson(Map<String, dynamic> json) => Geometry(
      bounds: json['bounds'] == null
          ? null
          : Bounds.fromJson(json['bounds'] as Map<String, dynamic>),
      location: json['location'] == null
          ? null
          : Northeast.fromJson(json['location'] as Map<String, dynamic>),
      locationType: json['location_type'] as String?,
      viewport: json['viewport'] == null
          ? null
          : Bounds.fromJson(json['viewport'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GeometryToJson(Geometry instance) => <String, dynamic>{
      'bounds': instance.bounds,
      'location': instance.location,
      'location_type': instance.locationType,
      'viewport': instance.viewport,
    };

Bounds _$BoundsFromJson(Map<String, dynamic> json) => Bounds(
      northeast: json['northeast'] == null
          ? null
          : Northeast.fromJson(json['northeast'] as Map<String, dynamic>),
      southwest: json['southwest'] == null
          ? null
          : Northeast.fromJson(json['southwest'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BoundsToJson(Bounds instance) => <String, dynamic>{
      'northeast': instance.northeast,
      'southwest': instance.southwest,
    };

Northeast _$NortheastFromJson(Map<String, dynamic> json) => Northeast(
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$NortheastToJson(Northeast instance) => <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };
