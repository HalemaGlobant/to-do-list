import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:todoey/repository/calendar_repository/calendar_repo.dart';
import 'package:todoey/widgets/holiday_widgets/holiday_assets/bloc/calendar_event.dart';
import 'package:todoey/widgets/holiday_widgets/holiday_assets/bloc/calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  final CalendarRepository repository;

  CalendarBloc(this.repository) : super(CalendarInitial()) {
    on<CalendarInitialFetchEvent>(_onFetch);
  }

  FutureOr<void> _onFetch(
    CalendarInitialFetchEvent event,
    Emitter<CalendarState> emit,
  ) async {
    emit(CalendarLoading());

    try {
      final assets = await repository.getTodayHoliday();
      if (assets != null) {
        emit(CalendarLoaded(assets));
      } else {
        emit(CalendarEmpty());
      }
    } catch (e) {
      emit(CalendarError('Something went wrong: $e'));
    }
  }
}
