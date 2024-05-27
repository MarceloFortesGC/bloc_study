import 'package:estudo_bloc/src/models/task_model.dart';

class TaskRepository {
  final List<TaskModel> _tasks = [];

  Future<List<TaskModel>> getTasks() async {
    _tasks.addAll([
      TaskModel(title: 'Compras no mercado'),
      TaskModel(title: 'Academia'),
      TaskModel(title: 'Buscar filhos na escola'),
      TaskModel(title: 'Outra coisa'),
    ]);

    return Future.delayed(const Duration(seconds: 2), () => _tasks);
  }

  Future<List<TaskModel>> postTask(TaskModel task) async {
    _tasks.add(task);
    return Future.delayed(const Duration(seconds: 2), () => _tasks);
  }

  Future<List<TaskModel>> deleteTask(TaskModel task) async {
    _tasks.remove(task);
    return Future.delayed(const Duration(seconds: 2), () => _tasks);
  }
}
