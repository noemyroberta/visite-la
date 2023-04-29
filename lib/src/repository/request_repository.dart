import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

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
}
