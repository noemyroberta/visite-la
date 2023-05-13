import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'map_page.dart';
import 'model/place_nearby_model.dart' as nearby;
import 'photo_place_view.dart';
import 'repository/request_repository.dart';
import 'utils/ask_location_permission.dart';
import 'utils/load_variables_json.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _placeNearbyRepository = PlaceNearbyRepository(Dio());
  final _location = Location();
  LatLng _currentLocation = const LatLng(0, 0);
  late List<nearby.Location> placesNearbyLocations;
  final List<String?> placesId = [];
  late final String? apiKey;

  @override
  void initState() {
    super.initState();
    getKey().then((value) => apiKey = value);
    AskLocationPermission.verifyLocationPermission();
    _getCurrentLocation().then((location) async {
      _currentLocation = location;
      await _getTouristAttractions(apiKey);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const SizedBox(height: 60.0),
            const Text(
              "Pontos perto de você",
              style: TextStyle(
                fontFamily: 'Ubuntu',
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF383838),
              ),
              textAlign: TextAlign.start,
            ),
            ListView.builder(
              itemCount: placesId.length,
              shrinkWrap: true,
              primary: false,
              itemBuilder: (_, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PhotoPlaceView(
                      placesId: placesId,
                      index: index,
                      apiKey: apiKey!,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: 144.0,
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.only(bottom: 16.0),
        child: ElevatedButton(
          onPressed: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MapPage(
                  currentLocation: _currentLocation,
                  spotsLocation: placesNearbyLocations,
                ),
              ),
            ),
          },
          style: ElevatedButton.styleFrom(
            primary: const Color(0xFF84BF49),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: const Text(
            "Mostrar rotas",
            style: TextStyle(
              fontFamily: 'Ubuntu',
              fontSize: 17.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future<LatLng> _getCurrentLocation() async {
    final locationData = await _location.getLocation();
    LatLng currentLocation = LatLng(
      locationData.latitude!,
      locationData.longitude!,
    );

    return currentLocation;
  }

  Future<void> _getTouristAttractions(String? apiKey) async {
    List<String?> spots = [];

    final touristAttractions =
        await _placeNearbyRepository.findTouristAttractionsByLocation(
      _currentLocation.latitude.toString(),
      _currentLocation.longitude.toString(),
      apiKey!,
    );

    if (touristAttractions.status == "OK") {
      placesNearbyLocations = touristAttractions.results!
          .map((e) => e.geometry!.location!)
          .toList();

      placesNearbyLocations.insert(
        0,
        nearby.Location(
          lat: _currentLocation.latitude,
          lng: _currentLocation.longitude,
        ),
      );

      for (final spot in touristAttractions.results!) {
        spots.add(spot.placeId);
      }

      setState(() {
        placesId.addAll(spots);
      });
    }
  }
}
