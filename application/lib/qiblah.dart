import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:location/location.dart';
import 'qiblah_compass.dart';

class QiblahScreen extends StatefulWidget {
  const QiblahScreen({super.key});

  @override
  _QiblahScreenState createState() => _QiblahScreenState();
}

class _QiblahScreenState extends State<QiblahScreen> {
  final Location location = Location();

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
    );
  }

  @override
  void initState() {
    super.initState();
    initQiblah();
  }

  Future<void> initQiblah() async {
    final isServiceEnabled = await location.serviceEnabled();
    final hasLocationPermission = await location.hasPermission();

    if (isServiceEnabled == true && hasLocationPermission == true) {
      // Continue with other location-related operations if needed
    } else {
      await location.requestService();
      await location.requestPermission();
    }
  }
}