import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoey/screens/add_task_screen.dart';
import 'package:todoey/tasks/create_task_bloc/create_task_bloc.dart';
import 'package:todoey/tasks/create_task_bloc/create_task_state.dart';
import 'package:todoey/widgets/holiday_widgets/holiday_assets/bloc/calandar_bloc.dart';
import 'package:todoey/widgets/holiday_widgets/holiday_assets/bloc/calendar_state.dart';
import 'package:todoey/widgets/holiday_widgets/holiday_banner/holiday_banner_screen.dart';
import 'package:todoey/widgets/tasks_widgets/tasks_list.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) => const AddTaskScreen(),
          );
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: const TasksList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 60, 30, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            backgroundColor: Colors.white,
            radius: 30.0,
            child: Icon(Icons.list, size: 30.0, color: Colors.lightBlueAccent),
          ),
          const SizedBox(height: 10),
          const Text(
            'Todoey',
            style: TextStyle(fontSize: 50, color: Colors.white),
          ),
          BlocBuilder<TaskBloc, TaskState>(
            builder: (context, state) {
              final count = (state is TaskLoaded) ? state.tasks.length : 0;
              return Text(
                '$count tasks',
                style: const TextStyle(color: Colors.white, fontSize: 18),
              );
            },
          ),
          const SizedBox(height: 16),
          BlocBuilder<CalendarBloc, CalendarState>(
            builder: (context, state) {
              if (state is CalendarLoaded) {
                return HolidayBanner(
                  imagePath: state.assets.imagePath,
                  message: state.assets.announcement,
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
