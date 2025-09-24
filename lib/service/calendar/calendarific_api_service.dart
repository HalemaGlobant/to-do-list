import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:todoey/models/calendar_model.dart';

part 'calendarific_api_service.g.dart';

abstract class ParseErrorLogger {
  void logError(
    Object error,
    StackTrace stackTrace,
    RequestOptions requestOptions,
  );
}

@RestApi(baseUrl: 'https://calendarific.com/api/v2/')
abstract class CalendarificApiService {
  factory CalendarificApiService(Dio dio, {String? baseUrl}) =
      _CalendarificApiService;

  @GET('holidays')
  Future<CalendarificResponse> getHolidays({
    @Query('api_key') required String apiKey,
    @Query('country') required String country,
    @Query('year') required int year,
    @Query('type') String? type,
    @Query('month') int? month,
    @Query('day') int? day,
  });
}
