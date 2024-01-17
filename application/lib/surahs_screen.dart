import 'package:flutter/material.dart';
import 'surah_al_waaqia_page.dart';
import 'surah_an_naas_page.dart';
import 'surah_al_mulk_page.dart';
import 'home_screen.dart' as Home;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SurahScreen(),
    );
  }
}

class SurahScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Surah'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SurahAnNaasPage()),
                );
              },
              child: Text('Surah An-Naas'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SurahAlMulkPage()),
                );
              },
              child: Text('Surah Al-Mulk'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SurahAlWaaqiaPage()),
                );
              },
              child: Text('Surah Al-Waaqia'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Home.NavigationBar(),
    );
  }
}
