import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'islamicalendar.dart';
import 'azan.dart';
import 'name_screen.dart';
import 'profile_screen.dart';
import 'duas_screen.dart';
import 'surahs_screen.dart';
import 'qiblah.dart';
import 'quotes_screen.dart';

class HomeScreen extends StatelessWidget {
  final IslamicCalendarService calendarService = IslamicCalendarService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Soulful Serenity: Islamic Reflections", style: TextStyle(fontSize: 20)),
            // Adding SfHijriDateRangePicker
            Container(
              height: 300, // Adjust the height as needed
              child: SfHijriDateRangePicker(
                view: HijriDatePickerView.month,
                selectionMode: DateRangePickerSelectionMode.single,
                showTodayButton: true,
                initialSelectedDate: HijriDateTime.now(),
                minDate: HijriDateTime(1440, 1, 1),
                maxDate: HijriDateTime(1500, 12, 30),
                showNavigationArrow: true,
                showActionButtons: true,
                selectionColor: Colors.blue,
                startRangeSelectionColor: Colors.blue.withOpacity(0.5),
                endRangeSelectionColor: Colors.blue.withOpacity(0.5),
                rangeSelectionColor: Colors.blue.withOpacity(0.3),
                selectionTextStyle: TextStyle(color: Colors.white),
                rangeTextStyle: TextStyle(color: Colors.white),
                monthCellStyle: DateRangePickerMonthCellStyle(
                  todayTextStyle: TextStyle(color: Colors.red),
                ),
                onViewChanged: (HijriDatePickerViewChangedArgs args) {
                  // Handle view change
                  print("Current view: ${args.view}");
                },
                onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                  // Handle date selection
                  HijriDateTime selectedDate = args.value;
                  print("Selected Islamic Date: ${selectedDate.toString()}");
                },
              ),
            ),
          ],
        ),
        centerTitle: true,
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
