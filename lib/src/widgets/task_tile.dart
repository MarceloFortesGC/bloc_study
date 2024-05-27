import 'package:flutter/material.dart';
import 'package:estudo_bloc/src/models/task_model.dart';
import 'package:estudo_bloc/src/bloc/task/task_bloc.dart';
import 'package:estudo_bloc/src/bloc/task/task_event.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.task,
    required this.taskBloc,
  });

  final TaskModel task;
  final TaskBloc taskBloc;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: IconButton(
        onPressed: () => taskBloc.inputTask.add(DeleteTasks(task: task)),
        icon: const Icon(Icons.delete, color: Colors.red),
      ),
      leading: CircleAvatar(child: Center(child: Text(task.title[0]))),
      title: Text(task.title),
    );
  }
}
