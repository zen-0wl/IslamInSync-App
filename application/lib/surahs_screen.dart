import 'package:flutter/material.dart';

class SurahsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Surahs"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("Surahs Content"),
      ),
    );
  }
}