import 'package:flutter/material.dart';

class NameScreen extends StatelessWidget {
  const NameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("99 Allah's Names"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text("Names Content"),
      ),
    );
  }
}