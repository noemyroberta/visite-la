import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../model/location_model.dart';

part 'location_repository.g.dart';

@RestApi(baseUrl: 'https://maps.googleapis.com/maps/api/geocode/json?')
abstract class ILocationRepository {
  factory ILocationRepository(Dio dio, {String baseUrl}) = _ILocationRepository;

  @GET('address={address}&key={key}')
  Future<LocationModel> findLocationByAddress(
    @Path('address') String address,
    @Path('key') String key,
  );
}
