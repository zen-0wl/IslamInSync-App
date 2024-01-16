import 'package:flutter/services.dart';

class IslamicCalendarService {
  static const platform = MethodChannel('your_channel_name');

  Future<String> getIslamicDate() async {
    try {
      final String result = await platform.invokeMethod('getIslamicDate');
      return result;
    } catch (e) {
      print('Error: $e');
      return 'Error fetching Islamic date';
    }
  }
}
