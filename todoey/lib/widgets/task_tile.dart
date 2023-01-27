// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/tasks_provider.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String? taskTitle;
  final Function(bool?)? checkboxCallback;
  final VoidCallback deleteCheckbox;

  const TaskTile({
    Key? key,
    this.isChecked = false,
    this.taskTitle,
    this.checkboxCallback,
    required this.deleteCheckbox,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tasksProvider = Provider.of<TasksProvider>(context).tasks;

    return ListTile(
      onLongPress: deleteCheckbox,
      title: Text(
        taskTitle!,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkboxCallback,
        // onChanged: toggleCheckboxState,
      ),
    );
  }
}
