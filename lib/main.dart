import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:todoey/repository/calendar_repository/calendar_repo.dart';
import 'package:todoey/screens/tasks_screen.dart';
import 'package:todoey/service/calendar/calendarific_api_service.dart';
import 'package:todoey/tasks/create_task_bloc/create_task_bloc.dart';
import 'package:todoey/widgets/holiday_widgets/holiday_assets/bloc/calandar_bloc.dart';
import 'package:todoey/widgets/holiday_widgets/holiday_assets/bloc/calendar_event.dart';

void main() {
  final calendarApi = CalendarificApiService(Dio());
  final calendarRepo = CalendarRepository(
    apiService: calendarApi,
    apiKey: '9gKLd6yqNfVGSW2eUhFEXeoD5qkkxKAn',
    countryCode: 'YE',
  );

  runApp(MyApp(repository: calendarRepo));
}

class MyApp extends StatelessWidget {
  final CalendarRepository repository;

  const MyApp({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => TaskBloc()),
        BlocProvider(
          create:
              (_) => CalendarBloc(repository)..add(CalendarInitialFetchEvent()),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TasksScreen(),
      ),
    );
  }
}
