import 'package:flutter/material.dart';
import 'app/pages/task_edit_page.dart';
import 'app/repositories/task_repository.dart';
import 'app/services/api_service.dart';
import 'app/services/task_service.dart';
import 'app/pages/task_list_page.dart';

void main() {
  final apiService = ApiService('http://localhost:8080');
  final taskService = TaskService(apiService);
  final taskRepository = TaskRepository(taskService);

  runApp(MyApp(taskRepository: taskRepository));
}

class MyApp extends StatelessWidget {
  final TaskRepository taskRepository;

  MyApp({required this.taskRepository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => TaskListPage(taskRepository: taskRepository),
        '/task-edit': (context) => TaskEditPage(taskRepository: taskRepository),
      },
    );
  }
}
