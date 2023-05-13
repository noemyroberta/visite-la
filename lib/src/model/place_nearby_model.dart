import 'package:json_annotation/json_annotation.dart';

part 'place_nearby_model.g.dart';

@JsonSerializable()
class PlaceNearbyModel {
  List<dynamic>? htmlAttributions;
  List<Results>? results;
  String? status;

  PlaceNearbyModel({this.htmlAttributions, this.results, this.status});

  factory PlaceNearbyModel.fromJson(Map<String, dynamic> json) => _$PlaceNearbyModelFromJson(json);
  Map<String, dynamic> toJson() => _$PlaceNearbyModelToJson(this);
}

@JsonSerializable()
class Results {
  String? businessStatus;
  Geometry? geometry;
  String? icon;
  String? iconBackgroundColor;
  String? iconMaskBaseUri;
  String? name;
  bool? permanentlyClosed;
  List<Photos>? photos;
  String? placeId;
  PlusCode? plusCode;
  double? rating;
  String? reference;
  String? scope;
  List<String>? types;
  int? userRatingsTotal;
  String? vicinity;
  OpeningHours? openingHours;

  Results(
      {this.businessStatus,
        this.geometry,
        this.icon,
        this.iconBackgroundColor,
        this.iconMaskBaseUri,
        this.name,
        this.permanentlyClosed,
        this.photos,
        this.placeId,
        this.plusCode,
        this.rating,
        this.reference,
        this.scope,
        this.types,
        this.userRatingsTotal,
        this.vicinity,
        this.openingHours});

  factory Results.fromJson(Map<String, dynamic> json) => _$ResultsFromJson(json);
  Map<String, dynamic> toJson() => _$ResultsToJson(this);
}
@JsonSerializable()
class Geometry {
  Location? location;
  Viewport? viewport;

  Geometry({this.location, this.viewport});

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
class Photos {
  int? height;
  List<String>? htmlAttributions;
  String? photoReference;
  int? width;

  Photos({this.height, this.htmlAttributions, this.photoReference, this.width});

  factory Photos.fromJson(Map<String, dynamic> json) => _$PhotosFromJson(json);
  Map<String, dynamic> toJson() => _$PhotosToJson(this);
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
class OpeningHours {
  bool? openNow;

  OpeningHours({this.openNow});

  factory OpeningHours.fromJson(Map<String, dynamic> json) => _$OpeningHoursFromJson(json);
  Map<String, dynamic> toJson() => _$OpeningHoursToJson(this);
}

