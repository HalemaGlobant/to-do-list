import 'package:dio/dio.dart';
import 'package:todoey/models/calendar_model.dart';
import 'package:todoey/service/calendar/calendarific_api_service.dart';
import 'package:todoey/service/calendar/holiday_assets.dart';

Future<HolidayAssets?> getTodayHolidayAssets() async {
  final today = DateTime.now();
  final api = CalendarificApiService(Dio());

  try {
    final response = await api.getHolidays(
      apiKey: '9gKLd6yqNfVGSW2eUhFEXeoD5qkkxKAn',
      country: 'SA',
      year: today.year,
      month: today.month,
      day: today.day,
    );

    Holiday? holiday;

    try {
      holiday = response.response.holidays.firstWhere((h) {
        final date = DateTime.parse(h.date.iso);
        return date.year == today.year &&
            date.month == today.month &&
            date.day == today.day;
      });
    } catch (e) {
      holiday = null;
    }

    if (holiday != null && holidayAssets.containsKey(holiday.name)) {
      return holidayAssets[holiday.name];
    }
  } catch (_) {}

  return null;
}
