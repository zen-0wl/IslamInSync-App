// surahAnNaas.dart

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SurahAnNaasPage extends StatefulWidget {
  @override
  _SurahAnNaasPageState createState() => _SurahAnNaasPageState();
}

class _SurahAnNaasPageState extends State<SurahAnNaasPage> {
  final String apiUrl = 'http://api.alquran.cloud/v1/surah/114';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Surah An-Naas'),
        backgroundColor: Color.fromARGB(255, 246, 241, 255),
      ),
      body: FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            Map<String, dynamic>? surahData = snapshot.data?['data'];

            if (surahData == null) {
              return Center(
                child: Text('Error: Data is null'),
              );
            }

            List<dynamic> ayahs = surahData['ayahs'];

            return Center(
              child: ListView(
                children: [
                  ListTile(
                    title: Text('Number: ${surahData['number']}'),
                  ),
                  ListTile(
                    title: Text('Name: ${surahData['name']}'),
                  ),
                  ListTile(
                    title: Text('English Name: ${surahData['englishName']}'),
                  ),
                  ListTile(
                    title: Text(
                        'Translation: ${surahData['englishNameTranslation']}'),
                  ),
                  ListTile(
                    title:
                        Text('Revelation Type: ${surahData['revelationType']}'),
                  ),
                  ListTile(
                    title:
                        Text('Number of Ayahs: ${surahData['numberOfAyahs']}'),
                  ),
                  for (var ayah in ayahs)
                    ListTile(
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Ayah Number: ${ayah['number']}'),
                          Text('Ayah Text: ${ayah['text']}'),
                        ],
                      ),
                    ),
                ],
              ),
            );
          }
        },
      ),
      backgroundColor: Color.fromARGB(255, 246, 241, 255),
    );
  }

  Future<Map<String, dynamic>> fetchData() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        return data;
      } else {
        throw Exception(
            'Failed to load data: ${response.statusCode} ${response.reasonPhrase}');
      }
    } catch (error) {
      return {'error': 'Error: $error'};
    }
  }
}
