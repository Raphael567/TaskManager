enum TaskStatus{ pending, inProgress, completed }

extension TaskStatusExtension on TaskStatus {
  static TaskStatus fromString(String status) {
    switch (status.toUpperCase()) {
        case 'PENDENTE':
          return TaskStatus.pending;
        case 'EM_ANDAMENTO':
          return TaskStatus.inProgress;
        case 'CONCLUIDA':
          return TaskStatus.completed;
        default:
          return TaskStatus.pending;
    }
  }
}