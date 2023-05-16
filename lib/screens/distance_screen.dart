import 'dart:async';

import 'package:courseproject/location_example.dart';
import 'package:fl_location/fl_location.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart' as geo;
import '../models/models.dart';

enum ButtonState { LOADING, DONE, DISABLED }

class DistanceScreen extends StatefulWidget {
  const DistanceScreen({super.key});

  @override
  State<DistanceScreen> createState() => _DistanceScreenState();
}

class _DistanceScreenState extends State<DistanceScreen> {
  String _result = '';
  ButtonState _getLocationButtonState = ButtonState.DONE;

  double _resultLatitude = 0;

  double _resultLongitude = 0;

  Future<bool> _checkAndRequestPermission({bool? background}) async {
    if (!await FlLocation.isLocationServicesEnabled) {
      // Location services are disabled.
      return false;
    }

    var locationPermission = await FlLocation.checkLocationPermission();
    if (locationPermission == LocationPermission.deniedForever) {
      // Cannot request runtime permission because location permission is denied forever.
      return false;
    } else if (locationPermission == LocationPermission.denied) {
      // Ask the user for location permission.
      locationPermission = await FlLocation.requestLocationPermission();
      if (locationPermission == LocationPermission.denied ||
          locationPermission == LocationPermission.deniedForever) return false;
    }

    // Location permission must always be allowed (LocationPermission.always)
    // to collect location data in the background.
    if (background == true &&
        locationPermission == LocationPermission.whileInUse) return false;

    // Location services has been enabled and permission have been granted.
    return true;
  }

  void _refreshPage() {
    setState(() {});
  }

  Future<void> _getLocation() async {
    if (await _checkAndRequestPermission()) {
      _getLocationButtonState = ButtonState.LOADING;
      _refreshPage();

      const timeLimit = Duration(seconds: 10);
      await FlLocation.getLocation(timeLimit: timeLimit).then((location) {
        _result = location.toJson().toString();
        _resultLatitude = location.latitude;
        _resultLongitude = location.longitude;
      }).onError((error, stackTrace) {
        _result = error.toString();
      }).whenComplete(() {
        _getLocationButtonState = ButtonState.DONE;
        _refreshPage();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // The getLocationServicesStatusStream function is not available in Web.
    if (!kIsWeb) {
      FlLocation.getLocationServicesStatusStream().listen((event) {
        print('location services status: $event');
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Distance')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 400,
            width: double.infinity,
            child: MinimumExample(),
          ),
          ElevatedButton(
            child: const Text('Get Distance'),
            onPressed: () async {
              final service =
                  ModalRoute.of(context)!.settings.arguments as BusinessService;
              SimpleLocation address = service.serviceLocation;

              final distance = await geo.Geolocator.distanceBetween(
                _resultLatitude,
                _resultLongitude,
                address
                    .latitude, //those should be the business providers address
                address.longitude,
                // Get latitude and longitude from the address using a geocoding service
              );

              // Display the distance in a dialog
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Distance'),
                  content: Text('''The distance between your location and'''
                      ''' the service provider address is ${(distance / 1000).toStringAsFixed(2)} kilo meters.'''
                      ''' your location lat,long : $_resultLatitude, $_resultLongitude'''),
                  actions: [
                    TextButton(
                      child: const Text('OK'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              );
            },
          ),
          _buildContentView(),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/min');
              },
              child: Text('use full screen map'))
        ],
      ),
    );
  }

  Widget _buildContentView() {
    final buttonList = _buildTestButton(
      text: 'GET Location',
      state: _getLocationButtonState,
      onPressed: _getLocation,
    );
    return buttonList;
  }

  Widget _buildTestButton({
    required String text,
    required ButtonState state,
    required VoidCallback? onPressed,
  }) {
    return ElevatedButton(
      onPressed: state == ButtonState.DONE ? onPressed : null,
      child: state == ButtonState.LOADING
          ? SizedBox.fromSize(
              size: const Size(20.0, 20.0),
              child: const CircularProgressIndicator(strokeWidth: 2.0),
            )
          : Text(text),
    );
  }
}
