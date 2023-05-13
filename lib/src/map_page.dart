import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:visite_la/src/model/dijkstra.dart';

import 'model/place_nearby_model.dart' as nearby;

class MapPage extends StatefulWidget {
  const MapPage({
    Key? key,
    required this.currentLocation,
    required this.spotsLocation,
  }) : super(key: key);

  final LatLng currentLocation;
  final List<nearby.Location> spotsLocation;

  @override
  State<MapPage> createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  late final CameraPosition _defaultLocation;
  final _controller = Completer<GoogleMapController>();
  Set<Polyline> _polylines = {};

  void _addPolyline(List<nearby.Location> spotLocations) {
    List<LatLng> polylineCoordinates =
        spotLocations.map((e) => LatLng(e.lat!, e.lng!)).toList();

    polylineCoordinates = generateMesh(polylineCoordinates);

    Polyline polyline = Polyline(
      polylineId: const PolylineId("polyline"),
      color: Colors.blue,
      width: 3,
      points: polylineCoordinates,
    );

    setState(() {
      _polylines.add(polyline);
    });
  }

  List<LatLng> generateMesh(List<LatLng> coordinates) {
    final userCoord = coordinates[0];
    return [
      userCoord,
      coordinates[1],
      userCoord,
      coordinates[2],
      coordinates[1],
      coordinates[2],
      coordinates[1],
      coordinates[3],
      coordinates[2],
      coordinates[4],
      coordinates[3],
      coordinates[4],
      coordinates[3],
      coordinates[5],
      coordinates[4],
      coordinates[5],
    ];
  }

  @override
  void initState() {
    super.initState();

    _defaultLocation = CameraPosition(
      target: widget.currentLocation,
      zoom: 19.151926040649414,
    );

    _addPolyline(widget.spotsLocation);
  }

  @override
  Widget build(BuildContext context) {
    Vertex userVertex = Vertex(
      0,
      nearby.Location(
          lat: widget.currentLocation.latitude,
          lng: widget.currentLocation.longitude),
    );
    final minorPath = _createGraph(widget.spotsLocation, userVertex);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GoogleMap(
        padding: const EdgeInsets.all(16.0),
        polylines: _polylines,
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        mapType: MapType.normal,
        initialCameraPosition: _defaultLocation,
        onMapCreated: (GoogleMapController controller) async {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: Container(
        width: double.infinity,
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.only(bottom: 16.0),
        child: ElevatedButton(
          onPressed: () => _createMinorPathPolyline(minorPath),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: const Text(
            "Mostrar melhor caminho",
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

  Map<Vertex, double> _createGraph(
      List<nearby.Location?> locationVertices, Vertex userVertex) {
    final graph = Graph();

    graph.addVertex(userVertex);
    for (int i = 0; i < locationVertices.length; i++) {
      graph.addVertex(Vertex(i + 1, locationVertices[i]));
    }

    graph.generateMesh();
    final distances = graph.dijkstra(userVertex);
    return distances;
  }

  _createMinorPathPolyline(Map<Vertex, double> minorPath) {
    final minorCoordinates = <LatLng>[];

    for (var vertex in minorPath.keys) {
      minorCoordinates.add(LatLng(
        vertex.location!.lat!,
        vertex.location!.lng!,
      ));
    }

    Polyline minorPathPolyline = Polyline(
      polylineId: const PolylineId("minor_path_polyline"),
      color: Colors.yellow,
      width: 3,
      points: minorCoordinates,
    );

    setState(() {
      _polylines.add(minorPathPolyline);
    });
  }
}
