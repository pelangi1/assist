import 'package:flutter/material.dart';
import '../models/todo_models.dart';

class TodoListProvider extends ChangeNotifier {
  List<TodoModel> _todoList = [];

  List<TodoModel> get todoList => _todoList;

  void addTodo(TodoModel todo) {
    _todoList.add(todo);
    notifyListeners();
  }

  void removeTodo(TodoModel todo) {
    // _todoList.remove(todo);
    _todoList = _todoList.where((item) => item.id != todo.id).toList();
    notifyListeners();
  }

  void updateTodo(TodoModel todo) {
    _todoList[_todoList.indexWhere((item) => item.id == todo.id)] = todo;
    notifyListeners();
  }
  
}