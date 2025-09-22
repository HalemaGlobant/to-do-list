import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  const TaskTile({super.key});

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;

  void toggleCheckbox(bool? value) {
    setState(() {
      isChecked = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text("data"),
      trailing: TaskCheckBox(isChecked: isChecked, onChanged: toggleCheckbox),
    );
  }
}

class TaskCheckBox extends StatelessWidget {
  final bool isChecked;
  final Function(bool?) onChanged;

  const TaskCheckBox({
    super.key,
    required this.isChecked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.lightBlueAccent,
      value: isChecked,
      onChanged: onChanged,
    );
  }
}
