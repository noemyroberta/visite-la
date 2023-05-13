import 'package:json_annotation/json_annotation.dart';
part 'place_detail_model.g.dart';

@JsonSerializable()
class PlaceDetailModel {
  List<dynamic>? htmlAttributions;
  Result? result;
  String? status;

  PlaceDetailModel({this.htmlAttributions, this.result, this.status});

  factory PlaceDetailModel.fromJson(Map<String, dynamic> json) => _$PlaceDetailModelFromJson(json);
  Map<String, dynamic> toJson() => _$PlaceDetailModelToJson(this);

  @override
  String toString() {
    return 'PlaceDetailModel{htmlAttributions: $htmlAttributions, result: $result, status: $status}';
  }
}

@JsonSerializable()
class Result {
  List<AddressComponents>? addressComponents;
  String? adrAddress;
  String? formattedAddress;
  Geometry? geometry;
  String? icon;
  String? iconBackgroundColor;
  String? iconMaskBaseUri;
  String? name;
  List<Photos>? photos;
  String? placeId;
  double? rating;
  String? reference;
  List<String>? types;
  String? url;
  int? utcOffset;

  Result(
      {this.addressComponents,
        this.adrAddress,
        this.formattedAddress,
        this.geometry,
        this.icon,
        this.iconBackgroundColor,
        this.iconMaskBaseUri,
        this.name,
        this.photos,
        this.placeId,
        this.rating,
        this.reference,
        this.types,
        this.url,
        this.utcOffset});

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
  Map<String, dynamic> toJson() => _$ResultToJson(this);

  @override
  String toString() {
    return 'Result{addressComponents: $addressComponents, adrAddress: $adrAddress, formattedAddress: $formattedAddress, geometry: $geometry, icon: $icon, iconBackgroundColor: $iconBackgroundColor, iconMaskBaseUri: $iconMaskBaseUri, name: $name, photos: $photos, placeId: $placeId, rating: $rating, reference: $reference, types: $types, url: $url, utcOffset: $utcOffset}';
  }
}

@JsonSerializable()
class AddressComponents {
  String? longName;
  String? shortName;
  List<String>? types;

  AddressComponents({this.longName, this.shortName, this.types});

  factory AddressComponents.fromJson(Map<String, dynamic> json) => _$AddressComponentsFromJson(json);
  Map<String, dynamic> toJson() => _$AddressComponentsToJson(this);

  @override
  String toString() {
    return 'AddressComponents{longName: $longName, shortName: $shortName, types: $types}';
  }
}

@JsonSerializable()
class Geometry {
  Location? location;
  Viewport? viewport;

  Geometry({this.location, this.viewport});

  factory Geometry.fromJson(Map<String, dynamic> json) => _$GeometryFromJson(json);
  Map<String, dynamic> toJson() => _$GeometryToJson(this);

  @override
  String toString() {
    return 'Geometry{location: $location, viewport: $viewport}';
  }
}

@JsonSerializable()
class Location {
  double? lat;
  double? lng;

  Location({this.lat, this.lng});

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);

  @override
  String toString() {
    return 'Location{lat: $lat, lng: $lng}';
  }
}

@JsonSerializable()
class Viewport {
  Location? northeast;
  Location? southwest;

  Viewport({this.northeast, this.southwest});

  factory Viewport.fromJson(Map<String, dynamic> json) => _$ViewportFromJson(json);
  Map<String, dynamic> toJson() => _$ViewportToJson(this);

  @override
  String toString() {
    return 'Viewport{northeast: $northeast, southwest: $southwest}';
  }
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

  @override
  String toString() {
    return 'Photos{height: $height, htmlAttributions: $htmlAttributions, photoReference: $photoReference, width: $width}';
  }
}