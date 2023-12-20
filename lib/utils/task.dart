import 'dart:convert';

import 'package:http/http.dart' as http;

class TaskService {
  static const String baseUrl = 'https://your-api-url/tasks';

  static Future<List<Task>> fetchTasks() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => Task.fromMap(item)).toList();
    } else {
      throw Exception('Failed to fetch tasks');
    }
  }

  static Future<void> createTask(Task task) async {
    final response = await http.post(Uri.parse(baseUrl),
        body: json.encode(task.toMap()), headers: {'Content-Type': 'application/json'});
    if (response.statusCode != 201) {
      throw Exception('Failed to create task');
    }
  }

// Implement updateTask() and deleteTask() methods similarly
}

class TaskQueue {
  static final List<Task> _queue = [];

  static void enqueue(Task task) {
    _queue.add(task);
  }

  static List<Task> dequeueAll() {
    final List<Task> tasks = List.from(_queue);
    _queue.clear();
    return tasks;
  }
}

class Task {
  int id;
  String title;
  bool completed;

  Task({required this.id, required this.title, this.completed = false});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'completed': completed ? 1 : 0,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      completed: map['completed'] == 1,
    );
  }
}