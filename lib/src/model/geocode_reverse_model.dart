import 'package:json_annotation/json_annotation.dart';

part 'geocode_reverse_model.g.dart';

@JsonSerializable()
class GeocodeReverseModel {
  PlusCode? plusCode;
  List<Results>? results;
  String? status;

  GeocodeReverseModel({this.plusCode, this.results, this.status});

  factory GeocodeReverseModel.fromJson(Map<String, dynamic> json) => _$GeocodeReverseModelFromJson(json);
  Map<String, dynamic> toJson() => _$GeocodeReverseModelToJson(this);
}

@JsonSerializable()
class PlusCode {
  String? compoundCode;
  String? globalCode;

  PlusCode({this.compoundCode, this.globalCode});

  factory PlusCode.fromJson(Map<String, dynamic> json) => _$PlusCodeFromJson(json);
  Map<String, dynamic> toJson() => _$PlusCodeToJson(this);
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
  Bounds? bounds;
  Northeast? location;
  String? locationType;
  Bounds? viewport;

  Geometry({this.bounds, this.location, this.locationType, this.viewport});

  factory Geometry.fromJson(Map<String, dynamic> json) => _$GeometryFromJson(json);
  Map<String, dynamic> toJson() => _$GeometryToJson(this);
}

@JsonSerializable()
class Bounds {
  Northeast? northeast;
  Northeast? southwest;

  Bounds({this.northeast, this.southwest});

  factory Bounds.fromJson(Map<String, dynamic> json) => _$BoundsFromJson(json);
  Map<String, dynamic> toJson() => _$BoundsToJson(this);
}

@JsonSerializable()
class Northeast {
  double? lat;
  double? lng;

  Northeast({this.lat, this.lng});

  factory Northeast.fromJson(Map<String, dynamic> json) => _$NortheastFromJson(json);
  Map<String, dynamic> toJson() => _$NortheastToJson(this);
}

