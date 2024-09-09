import 'dart:convert';
import 'api_service.dart';
import 'package:http/http.dart' as http;
import '../models/task.dart';

class TaskService {
  final ApiService apiService;

  TaskService(this.apiService);

  // Obtém as tarefas
  Future<List<Task>> getAllTasks() async {
    final response = await apiService.get('/tasks');

    if(response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((json) => Task.fromJson(json)).toList();
    } else {
      throw Exception("Falha ao carregar as Tarefas");
    }
  }

  // Obtém tarefa pelo id
  Future<Task> getTaskById(String id) async {
    final response = await apiService.get('/tasks/$id');

    if(response.statusCode == 200) {
      return Task.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Falha ao carregar Tarefa");
    }
  }

  // Cria nova tarefa
  Future<Task> createTask(Task task) async {
    final response = await apiService.post('/tasks', task.toJson());

    if(response.statusCode == 201) {
      return Task.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Falha ao criar Tarefa");
    }
  }

  // Atualiza tarefa existente
  Future<Task> updateTask(String id, Task task) async {
    final response = await apiService.put('/tasks/$id', task.toJson());

    if(response.statusCode == 200) {
      return Task.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Falha ao atualizar tarefa");
    }
  }

  // Deleta tarefa
  Future<void> deleteTask(String id) async {
    final response = await apiService.delete('/tasks/$id');

    if(response.statusCode != 204) {
      throw Exception("Falha ao deletar Tarefa");
    }
  }

  // Simulação de Stream, você deve substituir pelo seu método real para obter um Stream
  Stream<List<Task>> getTasksStream() async* {
    while (true) {
      await Future.delayed(Duration(seconds: 2)); // Simulação de delay
      final tasks = await getAllTasks();
      yield tasks;
    }
  }
}
