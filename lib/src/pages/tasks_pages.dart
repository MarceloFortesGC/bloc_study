import 'package:estudo_bloc/src/bloc/task/task_bloc.dart';
import 'package:estudo_bloc/src/bloc/task/task_event.dart';
import 'package:estudo_bloc/src/bloc/task/task_state.dart';
import 'package:estudo_bloc/src/models/task_model.dart';
import 'package:flutter/material.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  late final TaskBloc _taskBloc;

  @override
  void initState() {
    super.initState();
    // No momento que inicializar o Bloc, irá executar o listener e estará ouvindo
    // todas as alterações de estado que acontecer no Bloc
    _taskBloc = TaskBloc();
    _taskBloc.inputTask.add(GetTasks());
  }

  @override
  void dispose() {
    // Importante lembrar de fechar o Bloc para liberar a memória do dispositivo
    _taskBloc.inputTask.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Estudo Bloc Pattern',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: StreamBuilder<TaskState>(
          stream: _taskBloc.outputTask,
          builder: (context, state) {
            if (state.data is TaskLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TaskErrorState) {
              return const Center(child: Text('Ocorreu um erro'));
            } else {
              final data = state.data?.tasks ?? [];

              return ListView.separated(
                separatorBuilder: (_, __) => const Divider(),
                itemCount: data.length,
                itemBuilder: (_, i) {
                  final task = data[i];
                  return ListTile(
                    trailing: IconButton(
                      onPressed: () {
                        _taskBloc.inputTask.add(
                          DeleteTasks(task: task),
                        );
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                    leading: CircleAvatar(
                      child: Center(child: Text(task.title[0])),
                    ),
                    title: Text(task.title),
                  );
                },
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _taskBloc.inputTask.add(
            PostTasks(task: TaskModel(title: 'Nova Tarefa')),
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
