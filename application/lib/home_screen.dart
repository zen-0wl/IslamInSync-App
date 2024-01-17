import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'islamicalendar.dart';
import 'azan.dart';
import 'qiblah.dart';
import 'name_screen.dart';
import 'quotes_screen.dart';

class HomeScreen extends StatelessWidget {
  final IslamicCalendarService calendarService = IslamicCalendarService();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Soulful Serenity: Islamic Reflections",
            style: TextStyle(fontSize: 20)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Adding SfHijriDateRangePicker
            SfHijriDateRangePicker(
              view: HijriDatePickerView.month,
              selectionMode: DateRangePickerSelectionMode.single,
              showTodayButton: true,
              showNavigationArrow: true,
              showActionButtons: true,
              selectionColor: Colors.pink[100],
              startRangeSelectionColor: Colors.pink[100]?.withOpacity(0.5),
              endRangeSelectionColor: Colors.pink[100]?.withOpacity(0.5),
              rangeSelectionColor: Colors.pink[100]?.withOpacity(0.3),
              selectionTextStyle: const TextStyle(color: Colors.white),
              rangeTextStyle: const TextStyle(color: Colors.white),
              onViewChanged: (HijriDatePickerViewChangedArgs args) {
                // Handle view change
                print("Current view: ${args.view}");
              },
              onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                // Handle date selection
              },
            ),

            const SizedBox(height: 16),

            const Text("IslamInSync"),
            const SizedBox(height: 16),

            // Circle icon at the top
            const CircleAvatar(
              radius: 40,
              child: Icon(Icons.menu_book_rounded), // Placeholder icon
            ),

            const SizedBox(height: 16),

            // Azan and Qiblat in one row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ClickableRectangle("Azan", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AzanScreen()),
                  );
                }, const Color.fromARGB(255, 225, 210, 250)),
                const SizedBox(width: 16), // Add some spacing

                ClickableRectangle("Qiblat", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const QiblahScreen()),
                  );
                }, const Color.fromARGB(255, 225, 210, 250)),
              ],
            ),
            // more spacing between Azan and 99 Allah's Names
            const SizedBox(height: 16),
            // 99 Allah's Names and Quotes in one row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ClickableRectangle("99 Allah's Names", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NameScreen()),
                  );
                }, const Color.fromARGB(255, 225, 210, 250)),
                const SizedBox(width: 14), // Add some spacing
                ClickableRectangle("Hadith Quotes", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HadithScreen()),
                    );
                }, const Color.fromARGB(255, 225, 210, 250)),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const NavigationBar(),
    );
  }
}

class ClickableRectangle extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color backgroundColor;

  const ClickableRectangle(this.title, this.onPressed, this.backgroundColor,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 120,
        height: 70,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class NavigationBar extends StatelessWidget {
  const NavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: 'Duas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark),
          label: 'Surahs',
        ),
      ],
    );
  }
}
