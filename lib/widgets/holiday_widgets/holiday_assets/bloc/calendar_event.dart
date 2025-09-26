import 'package:equatable/equatable.dart';

abstract class CalendarEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CalendarInitialFetchEvent extends CalendarEvent {}
