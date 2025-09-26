import 'package:equatable/equatable.dart';
import 'package:todoey/widgets/holiday_widgets/holiday_assets/holiday_assets.dart';

abstract class CalendarState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CalendarInitial extends CalendarState {}

class CalendarLoading extends CalendarState {}

class CalendarLoaded extends CalendarState {
  final HolidayAssets assets;
  CalendarLoaded(this.assets);

  @override
  List<Object?> get props => [assets];
}

class CalendarEmpty extends CalendarState {}

class CalendarError extends CalendarState {
  final String message;
  CalendarError(this.message);

  @override
  List<Object?> get props => [message];
}
