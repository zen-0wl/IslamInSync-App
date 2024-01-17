import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NameScreen extends StatefulWidget {
  const NameScreen({Key? key}) : super(key: key);

  @override
  _NameScreenState createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  late List<NameData> names = []; // Initialize an empty list

  @override
  void initState() {
    super.initState();
    fetchNames();
  }

  Future<void> fetchNames() async {
    final response = await http.get(
      Uri.parse('https://api.aladhan.com/asmaAlHusna'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['data'];
      names = data.map((item) => NameData.fromJson(item)).toList();
      setState(() {});
    } else {
      throw Exception('Failed to load names');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("99 Allah's Names"),
        centerTitle: true,
      ),
      body: Container(
      color: const Color.fromARGB(255, 246, 241, 255), // Light purple background
      child: names.isNotEmpty
          ? ListView.builder(
              itemCount: names.length,
              itemBuilder: (context, index) {
                final name = names[index];
                return Column(
                  children: [
                    ListTile(
                      title: Text(
                        '${name.name} - ${name.transliteration}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                      subtitle: Text(
                        name.meaning,
                        style: const TextStyle(fontSize: 14, color: Colors.deepPurple),
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

class NameData {
  final String name;
  final String transliteration;
  final int number;
  final String meaning;

  NameData({
    required this.name,
    required this.transliteration,
    required this.number,
    required this.meaning,
  });

  factory NameData.fromJson(Map<String, dynamic> json) {
    return NameData(
      name: json['name'],
      transliteration: json['transliteration'],
      number: json['number'],
      meaning: json['en']['meaning'],
    );
  }
}