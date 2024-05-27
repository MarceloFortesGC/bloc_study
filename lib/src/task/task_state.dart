import 'package:estudo_bloc/src/models/task_model.dart';

abstract class TaskState {
  final List<TaskModel> tasks;

  TaskState({required this.tasks});
}

class TaskInitialState extends TaskState {
  TaskInitialState() : super(tasks: []);
}

class TaskLoadingState extends TaskState {
  TaskLoadingState() : super(tasks: []);
}

class TaskLoadedState extends TaskState {
  TaskLoadedState({required super.tasks});
}

class TaskErrorState extends TaskState {
  final Exception exception;
  TaskErrorState({required this.exception}) : super(tasks: []);
}
