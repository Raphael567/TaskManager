import 'package:flutter/material.dart';
import '../services/task_service.dart';
import '../models/task.dart';

class TaskRepository {
  final TaskService taskService;

  TaskRepository(this.taskService);

  Stream<List<Task>> getTasksStream() {
    return taskService.getTasksStream();
  }


  Future<List<Task>> getAllTasks() async {
    try {
      return await taskService.getAllTasks();
    } catch (e) {
      debugPrint('Error retrieving tasks: $e');
      rethrow;
    }
  }

  Future<Task> createTask(Task task) async {
    try {
      return await taskService.createTask(task);
    } catch(e) {
      debugPrint('Error creating task: $e');
      rethrow;
    }
  }

  Future<Task> updateTask(String id, Task task) async {
    try {
      return await taskService.updateTask(id, task);
    } catch(e) {
      debugPrint('Error updating task: $e');
      rethrow;
    }
  }

  Future<void> deleteTask(String id) async {
    try {
      return await taskService.deleteTask(id);
    } catch(e) {
      debugPrint('Error deleting task: $e');
      rethrow;
    }
  }
}
