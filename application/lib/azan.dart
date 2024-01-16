import 'package:flutter/material.dart';

class AzanQiblatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Azan"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("Azan Content"),
      ),
    );
  }
}