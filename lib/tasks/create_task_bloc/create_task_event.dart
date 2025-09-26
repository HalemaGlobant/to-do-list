import 'package:equatable/equatable.dart';

abstract class TaskEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddTaskEvent extends TaskEvent {
  final String taskTitle;

  AddTaskEvent(this.taskTitle);

  @override
  List<Object?> get props => [taskTitle];
}

class ToggleTaskEvent extends TaskEvent {
  final int index;

  ToggleTaskEvent(this.index);

  @override
  List<Object?> get props => [index];
}
