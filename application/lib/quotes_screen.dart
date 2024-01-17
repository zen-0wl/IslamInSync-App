import 'package:flutter/material.dart';

class QuoteScreen extends StatelessWidget {
  const QuoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quotes - hadiths"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text("Hadith Content"),
      ),
    );
  }
}