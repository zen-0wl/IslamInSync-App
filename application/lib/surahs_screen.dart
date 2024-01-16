import 'package:flutter/material.dart';

class SurahsScreen extends StatelessWidget {
  const SurahsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Surahs"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text("Surahs Content"),
      ),
    );
  }
}