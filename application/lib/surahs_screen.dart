// surahs_screen.dart

import 'package:flutter/material.dart';
import 'package:profile_page_2/SurahALWaaqia.dart';
import 'package:profile_page_2/SurahAlMulkPage.dart';
import 'package:profile_page_2/SurahAnNaasPage%20copy.dart';

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
