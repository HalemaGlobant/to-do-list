import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoey/models/task/tasks_model.dart';
import 'package:todoey/tasks/create_task_bloc/create_task_event.dart';
import 'package:todoey/tasks/create_task_bloc/create_task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskLoaded([])) {
    on<AddTaskEvent>((event, emit) {
      final state = this.state;
      if (state is TaskLoaded) {
        final updatedTasks = List<Task>.from(state.tasks)
          ..add(Task(title: event.taskTitle));
        emit(TaskLoaded(updatedTasks));
      }
    });

    on<ToggleTaskEvent>((event, emit) {
      final state = this.state;
      if (state is TaskLoaded) {
        final updatedTasks = List<Task>.from(state.tasks);
        final task = updatedTasks[event.index];
        updatedTasks[event.index] = task.copyWith(isDone: !task.isDone);
        emit(TaskLoaded(updatedTasks));
      }
    });
  }
}
