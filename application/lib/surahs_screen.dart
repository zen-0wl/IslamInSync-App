// surahs_screen.dart

import 'package:flutter/material.dart';
import 'SurahAlWaaqia.dart';
import 'SurahAlMulkPage.dart';
import 'SurahAnNaasPage copy.dart';

class SurahsScreen extends StatelessWidget {
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
    );
  }
}
