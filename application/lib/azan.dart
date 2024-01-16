import 'package:flutter/material.dart';
import 'package:adhan/adhan.dart';
import 'package:intl/intl.dart';

class AzanScreen extends StatelessWidget {
  final Coordinates myCoordinates = Coordinates(3.1390, 101.6869);
  final CalculationMethod calculationMethod = CalculationMethod.north_america;
  final Duration utcOffset = Duration(hours: 8); // Replace with your local UTC offset

  @override
  Widget build(BuildContext context) {
    final DateTime today = DateTime.now();
    final PrayerTimes prayerTimes = PrayerTimes(myCoordinates, DateComponents.from(DateTime.now()), calculationMethod.getParameters(), utcOffset: utcOffset);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(">> Prayer Times <<"),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 225, 210, 250), // Light purple background
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 16),
              Text(
                DateFormat.yMMMMd().format(today),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepPurple),
              ),
              const SizedBox(height: 16),
              buildPrayerTimeWidget("Fajr", prayerTimes.fajr, Icons.bedtime, today),
              buildPrayerTimeWidget("Sunrise", prayerTimes.sunrise, Icons.wb_sunny, today),
              buildPrayerTimeWidget("Dhuhr", prayerTimes.dhuhr, Icons.access_time, today),
              buildPrayerTimeWidget("Asr", prayerTimes.asr, Icons.access_time, today),
              buildPrayerTimeWidget("Maghrib", prayerTimes.maghrib, Icons.brightness_7, today),
              buildPrayerTimeWidget("Isha", prayerTimes.isha, Icons.bedtime, today),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPrayerTimeWidget(String title, DateTime prayerTime, IconData icon, DateTime today) {
    bool isCurrentPrayer = isTimeForPrayer(DateTime.now(), prayerTime);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 40,
                color: isCurrentPrayer ? Colors.white : Colors.deepPurple, // Highlight current prayer in white
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepPurple),
              ),
            ],
          ),
          Text(
            DateFormat.jm().format(prayerTime),
            style: TextStyle(fontSize: 18, color: isCurrentPrayer ? Colors.white : Colors.deepPurple), // Highlight time in white for current prayer
          ),
        ],
      ),
    );
  }

  bool isTimeForPrayer(DateTime now, DateTime prayerTime) {
    // Check if it's the time for the current prayer
    return now.isAfter(prayerTime) && now.isBefore(prayerTime.add(Duration(minutes: 10))); // Assuming a 10-minute window
  }
}