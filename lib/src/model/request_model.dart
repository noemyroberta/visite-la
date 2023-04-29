import 'package:json_annotation/json_annotation.dart';
part 'request_model.g.dart';

@JsonSerializable()
class RequestModel {
  List<Results>? results;
  String? status;

  RequestModel({this.results, this.status});

  factory RequestModel.fromJson(Map<String, dynamic> json) => _$RequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$RequestModelToJson(this);
}

@JsonSerializable()
class Results {
  List<AddressComponents>? addressComponents;
  String? formattedAddress;
  Geometry? geometry;
  String? placeId;
  PlusCode? plusCode;
  List<String>? types;

  Results(
      {this.addressComponents,
        this.formattedAddress,
        this.geometry,
        this.placeId,
        this.plusCode,
        this.types});

  factory Results.fromJson(Map<String, dynamic> json) => _$ResultsFromJson(json);
  Map<String, dynamic> toJson() => _$ResultsToJson(this);
}

@JsonSerializable()
class AddressComponents {
  String? longName;
  String? shortName;
  List<String>? types;

  AddressComponents({this.longName, this.shortName, this.types});

  factory AddressComponents.fromJson(Map<String, dynamic> json) => _$AddressComponentsFromJson(json);
  Map<String, dynamic> toJson() => _$AddressComponentsToJson(this);
}

@JsonSerializable()
class Geometry {
  Location? location;
  String? locationType;
  Viewport? viewport;

  Geometry({this.location, this.locationType, this.viewport});

  factory Geometry.fromJson(Map<String, dynamic> json) => _$GeometryFromJson(json);
  Map<String, dynamic> toJson() => _$GeometryToJson(this);
}

@JsonSerializable()
class Location {
  double? lat;
  double? lng;

  Location({this.lat, this.lng});

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable()
class Viewport {
  Location? northeast;
  Location? southwest;

  Viewport({this.northeast, this.southwest});

  factory Viewport.fromJson(Map<String, dynamic> json) => _$ViewportFromJson(json);
  Map<String, dynamic> toJson() => _$ViewportToJson(this);
}

@JsonSerializable()
class PlusCode {
  String? compoundCode;
  String? globalCode;

  PlusCode({this.compoundCode, this.globalCode});

  factory PlusCode.fromJson(Map<String, dynamic> json) => _$PlusCodeFromJson(json);
  Map<String, dynamic> toJson() => _$PlusCodeToJson(this);
}
