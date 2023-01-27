import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/widgets/task_tile.dart';

import '../provider/tasks_provider.dart';

class TasksList extends StatelessWidget {
  final List<Task> tasks;
  const TasksList({
    super.key,
    required this.tasks,
  });

  @override
  Widget build(BuildContext context) {
    // final tasksProvider = Provider.of<TasksProvider>(context).tasks;

    return Consumer<TasksProvider>(
      builder: (context, providerData, child) {
        return ListView.builder(
          itemCount: providerData.taskCounter,
          itemBuilder: (context, index) {
            final task = providerData.tasks[index];
            return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallback: (CheckboxState) {
                providerData.updateTask(task);
              },
              deleteCheckbox: () {
                providerData.deleteTask(index);
              },
            );
          },
        );
      },
    );
  }
}
