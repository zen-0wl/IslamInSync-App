import 'package:flutter/material.dart';

class DuasScreen extends StatelessWidget {
  const DuasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Duas"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text("Duas Content"),
      ),
    );
  }
}