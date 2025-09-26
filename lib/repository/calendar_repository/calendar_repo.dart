import 'package:todoey/service/calendar/calendarific_api_service.dart';
import 'package:todoey/widgets/holiday_widgets/holiday_assets/holiday_assets.dart';

class CalendarRepository {
  final CalendarificApiService apiService;
  final String apiKey;
  final String countryCode;

  CalendarRepository({
    required this.apiService,
    required this.apiKey,
    required this.countryCode,
  });

  Future<HolidayAssets?> getTodayHoliday() async {
    final today = DateTime.now();

    bool isSameDay(DateTime a, DateTime b) =>
        a.year == b.year && a.month == b.month && a.day == b.day;

    try {
      final response = await apiService.getHolidays(
        apiKey: apiKey,
        country: countryCode,
        year: today.year,
        month: today.month,
        day: today.day,
      );

      final holiday = response.response.holidays.firstWhere(
        (holiday) => isSameDay(DateTime.parse(holiday.date.iso), today),
      );

      return holidayAssets[holiday.name];
    } catch (e) {
      return null;
    }
  }
}
