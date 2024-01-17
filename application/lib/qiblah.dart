import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:location/location.dart';

class QiblahScreen extends StatefulWidget {
  @override
  _QiblahScreenState createState() => _QiblahScreenState();
}

class _QiblahScreenState extends State<QiblahScreen> {
  final Location location = Location();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Qiblah Direction"),
        centerTitle: true,
      ),
      body: QiblahCompass(
        onCompassError: (error) => Text("Error: $error"),
        onQiblahChange: (QiblahDirection qiblah) {
          // Handle Qiblah direction change
          print("Qiblah Direction: ${qiblah.direction}");
          print("North Direction: ${qiblah.north}");
          print("Qiblah Offset from North: ${qiblah.offset}");
        },
        child: (BuildContext context, QiblahContext qiblahContext) {
          // This is where you can build your UI based on Qiblah direction
          return Center(
            child: Text(
              "Qiblah Direction: ${qiblahContext.qiblah.direction.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 24),
            ),
          );
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
    if (await location.serviceEnabled() && await location.hasPermission()) {
      QiblahContextProvider.of(context).stream.listen((QiblahContext context) {
        // Handle Qiblah context changes
        print("Latitude: ${context.location.latitude}");
        print("Longitude: ${context.location.longitude}");
      });
    } else {
      // Request location permission and enable GPS
      await location.requestService();
      await location.requestPermission();
    }
  }
}
