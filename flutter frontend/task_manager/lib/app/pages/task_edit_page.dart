import 'package:flutter/material.dart';
import '../models/task.dart';
import '../repositories/task_repository.dart';
import '../enums/task_status.dart';

class TaskEditPage extends StatefulWidget {
  final Task? task;
  final TaskRepository taskRepository;

  TaskEditPage({this.task, required this.taskRepository});

  @override
  _TaskEditPageState createState() => _TaskEditPageState();
}

class _TaskEditPageState extends State<TaskEditPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  TaskStatus _status = TaskStatus.pending;

  @override
  void initState() {
    super.initState();
    if (widget.task != null) {
      _titleController.text = widget.task!.title;
      _descriptionController.text = widget.task!.description;
      _status = widget.task!.status;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.task == null ? 'Create Task' : 'Edit Task'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) => value?.isEmpty ?? true ? 'Please enter a title' : null,
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) => value?.isEmpty ?? true ? 'Please enter a description' : null,
              ),
              DropdownButtonFormField<TaskStatus>(
                value: _status,
                onChanged: (TaskStatus? newValue) {
                  setState(() {
                    _status = newValue!;
                  });
                },
                items: TaskStatus.values.map((TaskStatus status) {
                  return DropdownMenuItem<TaskStatus>(
                    value: status,
                    child: Text(status.value),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Status'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    final now = DateTime.now(); // Current date-time
                    final task = Task(
                      id: widget.task?.id,
                      title: _titleController.text,
                      description: _descriptionController.text,
                      status: _status,
                      createdAt: widget.task?.createdAt ?? now,
                      updatedAt: now,
                    );

                    try {
                      if (widget.task == null) {
                        await widget.taskRepository.createTask(task);
                      } else {
                        await widget.taskRepository.updateTask(task.id.toString(), task);
                      }
                      Navigator.pop(context, true);
                    } catch (e) {
                      print('Error saving task: $e');
                    }
                  }
                },
                child: Text(widget.task == null ? 'Create' : 'Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
