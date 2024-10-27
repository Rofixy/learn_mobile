import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Define the Todo model
class Todo {
  String title;
  String description;
  DateTime? deadline;

  Todo({
    required this.title,
    required this.description,
    this.deadline,
  });
}

// Service to manage CRUD operations
class TodoService with ChangeNotifier {
  final List<Todo> _todoList = [];

  // Get all todos
  List<Todo> get todos => List.unmodifiable(_todoList);

  // Add a new todo
  void addTodo(Todo todo) {
    _todoList.add(todo);
    notifyListeners(); // Notifies UI to rebuild when there's a change
  }

  // Delete a todo by index
  void deleteTodoAt(int index) {
    if (index < _todoList.length) {
      _todoList.removeAt(index);
      notifyListeners();
    }
  }
}
