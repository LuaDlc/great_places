// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:great_places/models/places.dart';

class MapPage extends StatefulWidget {
  final PlaceLocation initialLocation;

  const MapPage(
      {Key? key,
      this.initialLocation = const PlaceLocation(
        latitude: 37.422131,
        longitude: -122.084801,
      )})
      : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Selecione...'),
        ),
        body: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(widget.initialLocation.latitude,
                widget.initialLocation.longitude),
            zoom: 13,
          ),
        ));
  }
}
