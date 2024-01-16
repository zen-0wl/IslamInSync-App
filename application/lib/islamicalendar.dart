import 'package:flutter/services.dart';

class IslamicCalendarService {
  static const platform = MethodChannel('islamic_calendar_channel');

  IslamicCalendarService() {
    platform.setMethodCallHandler(_handleMethod);
  }

  Future<void> _handleMethod(MethodCall call) async {
    // Handle method calls from the native side if needed
  }

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
