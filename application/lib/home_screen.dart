import 'package:flutter/material.dart';
import 'islamicalendar.dart';
import 'azan_qiblat.dart';
import 'quotes_screen.dart';
import 'profile_screen.dart';
import 'duas_screen.dart';
import 'surahs_screen.dart';

class HomeScreen extends StatelessWidget {
  final IslamicCalendarService calendarService = IslamicCalendarService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Soulful Serenity: Islamic Reflections"),
        centerTitle: true,
        actions: [
          // Fetch and display Islamic date in the app bar
          FutureBuilder(
            future: calendarService.getIslamicDate(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SizedBox.shrink();
              } else if (snapshot.hasError) {
                return SizedBox.shrink();
              } else {
                String? islamicDate = snapshot.data;
                return Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Text(
                    "Islamic Date: $islamicDate",
                    style: TextStyle(fontSize: 16),
                  ),
                );
              }
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text("IslamInSync"),
          // Circle icon at the top
          CircleAvatar(
            radius: 50,
            child: Icon(Icons.add), // Placeholder icon
          ),
          SizedBox(height: 16),

          // Azan and Qiblat in one row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ClickableRectangle("Azan", () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AzanQiblatScreen()),
                );
              }),
              SizedBox(width: 16), // Add some spacing
              ClickableRectangle("Qiblat", () {
                // Handle Qiblat click
              }),
            ],
          ),

          // more spacing between Azan and 99 Allah's Names
          SizedBox(height: 16),

          // 99 Allah's Names and Quotes in one row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ClickableRectangle("99 Allah's Names", () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NamesQuotesScreen()),
                );
              }),
              SizedBox(width: 14), // Add some spacing
              ClickableRectangle("Quote", () {
                // Handle Quote click
              }),
            ],
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(),
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