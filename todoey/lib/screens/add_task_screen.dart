import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/provider/tasks_provider.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({super.key});

  final titleController = TextEditingController();
  String? newTaskTitle;

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksProvider>(
      builder: (context, tasksProvider, child) {
        return Container(
          color: const Color(0xff757575),
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 60,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Add Task',
                  style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.center,
                ),
                TextField(
                  controller: titleController,
                  autofocus: true,
                  textAlign: TextAlign.center,
                  onChanged: (newText) {
                    newTaskTitle = newText;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    tasksProvider.addTask(newTaskTitle.toString());

                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Add',
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
