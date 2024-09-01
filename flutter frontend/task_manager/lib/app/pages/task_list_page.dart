import 'package:flutter/material.dart';
import '../repositories/task_repository.dart';
import '../models/task.dart';

class TaskListPage extends StatefulWidget {
  final TaskRespository taskRepository;

  TaskListPage({required this.taskRepository});

  @override
  _TaskListPageState createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  late Future<List<Task>> _tasks;

  @override
  void initState() {
    super.initState();
    _tasks = widget.taskRepository.getAllTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Task List')),
      body: FutureBuilder<List<Task>>(
        future: _tasks,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final tasks = snapshot.data!;
            return ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return ListTile(
                  title: Text(task.title),
                  subtitle: Text(task.description),
                  onTap: () {
                    // Handle task tap, e.g., navigate to task details
                  },
                );
              },
            );
          } else {
            return Center(child: Text('No tasks found'));
          }
        },
      ),
    );
  }
}
