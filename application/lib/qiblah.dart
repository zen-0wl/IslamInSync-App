import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:location/location.dart';
import 'qiblah_compass.dart';

class QiblahScreen extends StatefulWidget {
  const QiblahScreen({Key? key}) : super(key: key);

  @override
  _QiblahScreenState createState() => _QiblahScreenState();
}

class _QiblahScreenState extends State<QiblahScreen> {
  final MockedLocationProvider locationProvider = MockedLocationProvider();
  bool isLocationMocked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Qiblah Direction"),
        centerTitle: true,
      ),
      body: FutureBuilder<bool?>(
        future: FlutterQiblah.androidDeviceSensorSupport(),
        builder: (context, AsyncSnapshot<bool?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          } else if (snapshot.data == true) {
            return QiblahCompass();
          } else {
            return Center(
              child: Text("Device sensors not supported."),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Toggle between mocked and real location
          isLocationMocked = !isLocationMocked;
          if (isLocationMocked) {
            locationProvider.mockLocation();
          } else {
            locationProvider.restoreLocation();
          }
        },
        child: Icon(Icons.location_searching),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    initQiblah();
  }

  Future<void> initQiblah() async {
    final isServiceEnabled = await locationProvider.serviceEnabled();
    final hasLocationPermission = await locationProvider.hasPermission();

    if (isServiceEnabled == false) {
      await locationProvider.requestService();
    }

    if (hasLocationPermission == false) {
      await locationProvider.requestPermission();
    }

    // Continue with other location-related operations if needed
  }
}

class MockedLocationProvider {
  final Location _location = Location();

  Future<bool?> serviceEnabled() async {
    return _location.serviceEnabled();
  }

  Future<Future<PermissionStatus>> hasPermission() async {
    return _location.hasPermission();
  }

  Future<Future<bool>> requestService() async {
    return _location.requestService();
  }

  Future<Future<PermissionStatus>> requestPermission() async {
    return _location.requestPermission();
  }

  // Mock location for testing purposes
  void mockLocation() {
    _location.changeSettings(accuracy: LocationAccuracy.high, interval: 1000);
    _location.onLocationChanged.listen((LocationData locationData) {
      // Mocked location
      locationData = LocationData.fromMap({
        'latitude': 3.1390, // Kuala Lumpur latitude
        'longitude': 101.6869, // Kuala Lumpur longitude
      });
      // Use the mocked location for your testing
    });
  }

  // Restore to real location
  void restoreLocation() {
    _location.changeSettings(accuracy: LocationAccuracy.high, interval: 1000);
    // Restore to real location settings
  }
}
