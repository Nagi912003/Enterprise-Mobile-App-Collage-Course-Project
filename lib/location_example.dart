import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:latlong2/latlong.dart';

class MinimumExample extends StatefulWidget {
  @override
  State<MinimumExample> createState() => _MinimumExampleState();
}

class _MinimumExampleState extends State<MinimumExample> {
  late FollowOnLocationUpdate _followOnLocationUpdate;
  late StreamController<double?> _followCurrentLocationStreamController;

  @override
  void initState() {
    super.initState();
    _followOnLocationUpdate = FollowOnLocationUpdate.always;
    _followCurrentLocationStreamController = StreamController<double?>();
  }

  @override
  void dispose() {
    _followCurrentLocationStreamController.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(0, 0),
          zoom: 1,
          maxZoom: 19,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c','d'],
            maxZoom: 19,
          ),
          CurrentLocationLayer(
            followOnLocationUpdate: FollowOnLocationUpdate.always,
            turnOnHeadingUpdate: TurnOnHeadingUpdate.never,
            style: const LocationMarkerStyle(
              marker: DefaultLocationMarker(
                child: Icon(
                  Icons.navigation,
                  color: Colors.white,
                ),
              ),
              markerSize: Size(40, 40),
              markerDirection: MarkerDirection.heading,
            ),
          ),
          CurrentLocationLayer(
            followOnLocationUpdate: FollowOnLocationUpdate.once,
            turnOnHeadingUpdate: TurnOnHeadingUpdate.always,
            style:  LocationMarkerStyle(
              marker: const DefaultLocationMarker(
                color: Colors.deepPurple,
                child: Icon(
                  Icons.navigation,
                  color: Colors.white,
                ),
              ),
              //headingSectorColor: Colors.deepPurple,
              accuracyCircleColor: Color(0x559575E9)!,
              markerSize: const Size(40, 40),
              markerDirection: MarkerDirection.heading,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Follow the location marker on the map when location updated until user interact with the map.
          setState(
                () => _followOnLocationUpdate = FollowOnLocationUpdate.always,
          );
          // Follow the location marker on the map and zoom the map to level 18.
          _followCurrentLocationStreamController.add(18);
        },
        child: const Icon(
          Icons.my_location,
          color: Colors.white,
        ),
      ),
    );
  }
}