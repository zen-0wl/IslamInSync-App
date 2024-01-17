import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class Dua {
  final String doa;
  final String ayat;
  final String latin;
  final String artinya;

  Dua({
    required this.doa,
    required this.ayat,
    required this.latin,
    required this.artinya,
  });

  factory Dua.fromJson(Map<String, dynamic> json) {
    return Dua(
      doa: json['doa'],
      ayat: json['ayat'],
      latin: json['latin'],
      artinya: json['artinya'],
    );
  }
}

class DuaPage extends StatefulWidget {
  @override
  _DuaPageState createState() => _DuaPageState();
}

class _DuaPageState extends State<DuaPage> {
  List<Dua> duas = [];
  Dua? selectedDua;

  @override
  void initState() {
    super.initState();
    fetchDataFromApi();
  }

  Future<void> fetchDataFromApi() async {
    final response = await http
        .get(Uri.parse('https://doa-doa-api-ahmadramadhan.fly.dev/api'));

    if (response.statusCode == 200) {
      final List<dynamic> duaList = json.decode(response.body);
      setState(() {
        duas = duaList.map((json) => Dua.fromJson(json)).toList();
      });
    } else {
      throw Exception('Failed to load dua data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dua Page'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Selected Dua:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  selectedDua != null
                      ? Card(
                          elevation: 3,
                          margin: EdgeInsets.symmetric(vertical: 5),
                          color: Colors.blue.shade50,
                          child: Padding(
                            padding: const EdgeInsets.all(50.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  selectedDua!.doa,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 10),
                                Text('Ayat: ${selectedDua!.ayat}',
                                    textAlign: TextAlign.center),
                                SizedBox(height: 5),
                                Text('Latin: ${selectedDua!.latin}',
                                    textAlign: TextAlign.center),
                                SizedBox(height: 5),
                                Text('Artinya: ${selectedDua!.artinya}',
                                    textAlign: TextAlign.center),
                              ],
                            ),
                          ),
                        )
                      : Text('No dua selected'),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _showDuasDialog(context);
                    },
                    child: Text('Select Dua'),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showDuasDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select a Dua'),
          content: Container(
            width: double.maxFinite,
            child: ListView.builder(
              itemCount: duas.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(duas[index].doa),
                  onTap: () {
                    setState(() {
                      selectedDua = duas[index];
                    });
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Duas App',
      home: DuaPage(),
    );
  }
}
