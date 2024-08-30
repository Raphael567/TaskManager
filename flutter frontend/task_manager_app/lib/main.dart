import 'package:flutter/material.dart';
import 'package:task_manager_app/app/models/task.dart';
import 'package:task_manager_app/app/repositories/task_repository.dart';
import 'package:task_manager_app/app/services/api_service.dart';
import 'package:task_manager_app/app/services/task_service.dart';
import 'app/pages/task_list_page.dart';

void main() {
  final apiService = ApiService('http://localhost:8080');
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
