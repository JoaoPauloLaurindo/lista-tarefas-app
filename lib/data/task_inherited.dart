import 'package:dev_flutter/components/task.dart';
import 'package:flutter/material.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<Task> taskList = [
    Task('Aprender Flutter', 'assets/images/loki.jpg', 1),
    Task('Violão', 'assets/images/loki.jpg', 4),
    Task('Rezar', 'assets/images/loki.jpg', 1),
    Task('História', 'assets/images/loki.jpg', 5),
    Task('Jogar', 'assets/images/loki.jpg', 2),
  ];

  void newTask(Task task){
    taskList.add(task);
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
