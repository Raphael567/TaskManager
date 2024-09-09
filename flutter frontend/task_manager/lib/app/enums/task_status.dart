enum TaskStatus { pending, inProgress, completed }

extension TaskStatusExtension on TaskStatus {
  String get value {
    switch (this) {
      case TaskStatus.inProgress:
        return 'EM_ANDAMENTO';
      case TaskStatus.completed:
        return 'CONCLUIDA';
      case TaskStatus.pending:
      default:
        return 'PENDENTE';
    }
  }

  static TaskStatus fromString(String status) {
    switch (status) {
      case 'EM_ANDAMENTO':
        return TaskStatus.inProgress;
      case 'CONCLUIDA':
        return TaskStatus.completed;
      case 'PENDENTE':
      default:
        return TaskStatus.pending;
    }
  }
}
