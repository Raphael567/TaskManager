import 'package:intl/intl.dart';
import '../enums/task_status.dart';

class Task {
  final int id;
  final String title;
  final String description;
  final TaskStatus status;
  final DateTime createdAt;
  final DateTime updatedAt;

  //Campos sendo passsados pelo método construtor
  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.createdAt,
    required this.updatedAt
  });

  //Retorna um Map, onde a chave é uma string e os seus valores são dinâmicos
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      status: TaskStatusExtension.fromString(json['status']),
      createdAt: _parseDate(json['createdAt']),
      updatedAt: _parseDate(json['updatedAt'])
    );
  }

  //Converte os dados para JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      /*Converte para string e depois divide em uma lista de substrings
      'TaskStatus.pending' = ['TaskStatus', 'pending']
      logo em seguida o .last() retorna o útlimo elemento do array em UpperCase -> pending = PENDING, o valor do Enum*/
      'status': status.toString().split('.').last.toUpperCase(),
      'createdAt': _formatDate(createdAt),
      'updatedAt': _formatDate(updatedAt)
    };
  }

  // Converte DateTime para String para enviar dados a API ou exibir ao usuário
  static String _formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  //Converte a Data String vinda da API para DateTime, possibilitando manipular no Dart
  static DateTime _parseDate(String date) {
    return DateFormat('yyyy-MM-dd').parse(date);
  }
}