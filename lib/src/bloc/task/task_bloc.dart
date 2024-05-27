import 'dart:async';

import 'package:estudo_bloc/src/bloc/task/task_event.dart';
import 'package:estudo_bloc/src/bloc/task/task_state.dart';
import 'package:estudo_bloc/src/models/task_model.dart';
import 'package:estudo_bloc/src/repositories/task_repository.dart';

class TaskBloc {
  final _repository = TaskRepository();

  // O BLoC recebe um evento
  final StreamController<TaskEvent> _inputTaskController =
      StreamController<TaskEvent>();

  // O BLoC devolve um estado
  final StreamController<TaskState> _outputTaskController =
      StreamController<TaskState>();

  // Expondo e tornando público o input de eventos
  Sink<TaskEvent> get inputTask => _inputTaskController.sink;

  // Expondo e tornando público o output de states
  Stream<TaskState> get outputTask => _outputTaskController.stream;

  // No momento em que a classe TaskBloc for inicializada já será inicializado
  // o listener dele.
  TaskBloc() {
    _inputTaskController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(TaskEvent event) async {
    List<TaskModel> tasks = [];

    // Define que o estado atual do bloc é carregando
    _outputTaskController.add(TaskLoadingState());

    if (event is GetTasks) {
      tasks = await _repository.getTasks();
    } else if (event is PostTasks) {
      tasks = await _repository.postTask(event.task);
    } else if (event is DeleteTasks) {
      tasks = await _repository.deleteTask(event.task);
    } else {
      throw 'Not mapped';
    }

    // Retorna o estado do bloc para carregado e retorna a lista de tasks
    _outputTaskController.add(TaskLoadedState(tasks: tasks));
  }
}
