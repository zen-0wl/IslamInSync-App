import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HadithScreen extends StatefulWidget {
  const HadithScreen({Key? key}) : super(key: key);

  @override
  _HadithScreenState createState() => _HadithScreenState();
}

class _HadithScreenState extends State<HadithScreen> {
  late List<HadithData> hadiths = [];
  late http.Response _response;

  @override
  void initState() {
    super.initState();
    fetchHadiths();
  }

  Future<void> fetchHadiths() async {
    print("Fetching Hadiths...");

    try {
      _response = await http.get(
        Uri.parse('http://cdn.jsdelivr.net/gh/fawazahmed0/hadith-api@1/editions/eng-abudawud.json'),
      );

      print("Received Hadiths response");

      if (mounted) {
        setState(() {
          // Assuming 'eng-abudawud' contains an array of hadiths
          final List<dynamic> engAbuDawudHadiths = jsonDecode(_response.body)['eng-abudawud'] ?? [];
          hadiths = engAbuDawudHadiths.map((item) => HadithData.fromJson(item)).toList();
        });
      }
    } catch (e) {
      print("Error fetching Hadiths: $e");
      // Handle the error appropriately, e.g., show an error message
    }
  }

  @override
  void dispose() {
    // Cancel any asynchronous operations here
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quoted Hadiths"),
        centerTitle: true,
      ),
      body: Container(
        color: const Color.fromARGB(255, 246, 241, 255),
        child: hadiths.isNotEmpty
            ? ListView.builder(
                itemCount: hadiths.length,
                itemBuilder: (context, index) {
                  final hadith = hadiths[index];
                  return Column(
                    children: [
                      ListTile(
                        title: Text(
                          '${hadith.text}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                      Container(
                        height: 1,
                        color: Colors.deepPurple,
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ],
                  );
                },
              )
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class HadithData {
  final String book;
  final int hadithNumber;
  final String text;

  HadithData({
    required this.book,
    required this.hadithNumber,
    required this.text,
  });

  factory HadithData.fromJson(Map<String, dynamic> json) {
    return HadithData(
      book: json['book'] ?? "",
      hadithNumber: json['hadith_number'] ?? 0,
      text: json['text'] ?? "",
    );
  }
}