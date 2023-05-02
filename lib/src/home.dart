import 'dart:async';
import 'package:dio/dio.dart';
import 'package:dotenv/dotenv.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;
import 'package:visite_la/src/model/geocode_reverse_model.dart';
import 'package:visite_la/src/repository/request_repository.dart';

import 'model/place_model.dart' as model;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  final _location = loc.Location();
  late loc.PermissionStatus _permissionGranted;

  final _controller = Completer<GoogleMapController>();
  final _placeRepository = PlaceRepository(Dio());

  bool _isInCurrentLocation = false;
  String _placeId = "", _apiKey = "";

  final CameraPosition _defaultLocation = const CameraPosition(
    target: LatLng(-9.6354475, -36.5413969),
    zoom: 14.4746,
  );

  void _verifyLocationPermission() async {
    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == loc.PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
      if (_permissionGranted != loc.PermissionStatus.granted) {
        return;
      }
    }
  }

  void _setApiKey() async {
    final env = await DotEnv(includePlatformEnvironment: true)
      ..load();
    _apiKey = env['API_KEY'] ?? "";
  }

  @override
  void initState() {
    _verifyLocationPermission();
    _setApiKey();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            padding: const EdgeInsets.all(16.0),
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            mapType: MapType.normal,
            initialCameraPosition: _defaultLocation,
            onMapCreated: (GoogleMapController controller) async {
              _controller.complete(controller);
            },
          ),
          Visibility(
            visible: _isInCurrentLocation,
            child: Container(
              color: Colors.white,
              child: FutureBuilder<model.PlaceModel>(
                future: _placeRepository.findTouristAttractionsByLocation(
                    _placeId, _apiKey),
                builder: (context, AsyncSnapshot<model.PlaceModel> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: snapshot.data!.result!.photos!
                        .map((e) => Text('Place: ${e.htmlAttributions![0]}'))
                        .toList(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async => await _goToCurrentLocation(_apiKey),
        label: const Text('Current Location'),
        icon: const Icon(Icons.place),
      ),
    );
  }

  Future<void> _goToCurrentLocation(String? apiKey) async {
    final locationData = await _location.getLocation();
    final GoogleMapController controller = await _controller.future;

    LatLng currentLocation =
        LatLng(locationData.latitude!, locationData.longitude!);

    final CameraPosition navigateTo = CameraPosition(
      target: currentLocation,
      zoom: 19.151926040649414,
    );

    await controller.animateCamera(CameraUpdate.newCameraPosition(navigateTo));
    _placeId = await _getPlaceIdByCurrentLocation(currentLocation, apiKey);

    if (_placeId.isNotEmpty) {
      setState(() {
        _isInCurrentLocation = true;
      });
    }
  }

  Future<String> _getPlaceIdByCurrentLocation(
    LatLng location,
    String? apiKey,
  ) async {
    final locationRepository = LocationRepository(Dio());

    GeocodeReverseModel geo = await locationRepository.findPlaceIdByLocation(
      location.latitude.toString(),
      location.longitude.toString(),
      apiKey!,
    );

    if (geo.status == 'OK') {
      return geo.results![0].placeId!;
    }

    return '';
  }
}
