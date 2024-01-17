import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';

class QiblahScreen extends StatefulWidget {
  const QiblahScreen({Key? key}) : super(key: key);

  @override
  _QiblahScreenState createState() => _QiblahScreenState();
}

class _QiblahScreenState extends State<QiblahScreen> {
  late Stream<QiblahDirection> qiblahStream;

  @override
  void initState() {
    super.initState();
    qiblahStream = FlutterQiblah.qiblahStream;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Qiblah Directions"),
        centerTitle: true,
      ),
      body: StreamBuilder<QiblahDirection>(
        stream: qiblahStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text("Unable to determine Qiblah direction"));
          } else {
            final QiblahDirection qiblah = snapshot.data!;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Qiblah Direction: ${qiblah.direction.toStringAsFixed(2)}"),
                  const SizedBox(height: 16),
                  // You can display more information as needed
                  // For example: North Direction, Qiblah Offset from North, etc.
                ],
              ),
            );
          }
        },
      ),
    );
  }
}