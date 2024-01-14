import 'package:flutter/material.dart';
import 'azan_qiblat.dart';
import 'quotes_screen.dart';
import 'profile_screen.dart';
import 'duas_screen.dart';
import 'surahs_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Soulful Serenity: Islamic Reflections"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Title at the top center"),
          CircleAvatar(
            radius: 50,
            child: Icon(Icons.add), // Placeholder icon
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ClickableRectangle("Azan", () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AzanQiblatScreen()),
                );
              }),
              ClickableRectangle("Qiblat", () {
                // Handle Qiblat click
              }),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ClickableRectangle("99 Allah's Names", () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NamesQuotesScreen()),
                );
              }),
              ClickableRectangle("Quotes", () {
                // Handle Quotes click
              }),
            ],
          ),
          NavigationBar(),
        ],
      ),
    );
  }
}

class ClickableRectangle extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const ClickableRectangle(this.title, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 100,
        height: 50,
        color: Colors.blue,
        child: Center(
          child: Text(title),
        ),
      ),
    );
  }
}

class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: 'Duas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu_book),
          label: 'Surahs',
        ),
      ],
    );
  }
}