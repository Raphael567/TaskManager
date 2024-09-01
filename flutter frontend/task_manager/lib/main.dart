import 'package:flutter/material.dart';
import 'app/repositories/task_repository.dart';
import 'app/services/api_service.dart';
import 'app/services/task_service.dart';
import 'app/pages/task_list_page.dart';

void main() {
  final apiService = ApiService('http://SEU_IP:8080');
  final taskService = TaskService(apiService);
  final taskRepository = TaskRespository(taskService);

  runApp(MyApp(taskRespository: taskRepository));
}

class MyApp extends StatelessWidget {

  final TaskRespository taskRespository;

  MyApp({required this.taskRespository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TaskListPage(taskRepository: taskRespository),
    );
  }
}
