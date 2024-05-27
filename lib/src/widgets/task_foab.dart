import 'package:estudo_bloc/src/bloc/task/task_bloc.dart';
import 'package:estudo_bloc/src/bloc/task/task_event.dart';
import 'package:estudo_bloc/src/bloc/task/task_state.dart';
import 'package:estudo_bloc/src/models/task_model.dart';
import 'package:flutter/material.dart';

class TaskFoab extends StatefulWidget {
  const TaskFoab({
    super.key,
    required this.taskBloc,
    required this.state,
  });

  final TaskBloc taskBloc;
  final TaskState state;

  @override
  State<TaskFoab> createState() => _TaskFoabState();
}

class _TaskFoabState extends State<TaskFoab> {
  String? newTask;

  void onSaveNewTask() {
    Navigator.pop(context);
    widget.taskBloc.inputTask.add(
      PostTasks(task: TaskModel(title: newTask!)),
    );
  }

  void onTapNewTask() async {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
      ),
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            // precisa ter mais um padding para evitar que o teclado sobreponha o conteúdo do modal
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Digite o nome da tarefa'),
                    const Divider(color: Colors.transparent),
                    TextField(onChanged: (value) {
                      newTask = value;
                      setState(() {});
                    }),
                    const Divider(color: Colors.transparent),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: newTask != null && newTask!.isNotEmpty
                          ? onSaveNewTask
                          : null,
                      child: const Text('Salvar'),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: widget.state is TaskLoadingState ? null : onTapNewTask,
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}
