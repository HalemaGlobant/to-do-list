import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoey/tasks/create_task_bloc/create_task_state.dart';

import 'package:todoey/widgets/tasks_widgets/task_tile.dart';
import 'package:todoey/tasks/create_task_bloc/create_task_bloc.dart';

import 'package:todoey/tasks/create_task_bloc/create_task_event.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        if (state is TaskLoaded) {
          final tasks = state.tasks;

          if (tasks.isEmpty) {
            return const Center(
              child: Text(
                'No tasks yet!',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            );
          }

          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return TaskTile(
                title: task.title,
                isChecked: task.isDone,
                onChanged: (value) {
                  context.read<TaskBloc>().add(ToggleTaskEvent(index));
                },
              );
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
