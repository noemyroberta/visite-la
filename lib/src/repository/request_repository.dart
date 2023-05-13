import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/geocode_reverse_model.dart';
import '../model/place_detail_model.dart';
import '../model/place_nearby_model.dart';
import '../model/request_model.dart';

part 'request_repository.g.dart';

@RestApi(baseUrl: 'https://maps.googleapis.com/maps/api/geocode/json?')
abstract class LocationRepository {
  factory LocationRepository(Dio dio, {String baseUrl}) = _LocationRepository;

  @GET('address={address}&key={key}')
  Future<RequestModel> findLocationByAddress(
    @Path('address') String address,
    @Path('key') String key,
  );

  @GET('latlng={lat},{lng}&key={key}')
  Future<GeocodeReverseModel> findPlaceIdByLocation(
    @Path('lat') String lat,
    @Path('lng') String lng,
    @Path('key') String key,
  );
}

@RestApi(baseUrl: 'https://maps.googleapis.com/maps/api/place/details/json?')
abstract class PlaceDetailsRepository {
  factory PlaceDetailsRepository(
    Dio dio, {
    String baseUrl,
  }) = _PlaceDetailsRepository;

  @GET('place_id={place_id}&type=tourist_attraction&key={key}')
  Future<PlaceDetailModel> findDetailsByPlaceId(
    @Path('place_id') String placeId,
    @Path('key') String key,
  );
}

@RestApi(baseUrl: 'https://maps.googleapis.com/maps/api/place/nearbysearch/json?')
abstract class PlaceNearbyRepository {
  factory PlaceNearbyRepository(
    Dio dio, {
    String baseUrl
  }) = _PlaceNearbyRepository;

  @GET('location={lat},{lng}&radius=30000&type=tourist_attraction&key={key}')
  Future<PlaceNearbyModel> findTouristAttractionsByLocation(
    @Path('lat') String lat,
    @Path('lng') String lng,
    @Path('key') String key,
  );
}
