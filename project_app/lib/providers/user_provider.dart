import 'package:flutter/material.dart';
import '../api/firebase_todo_api.dart';
import '../api/firebase_users_api.dart';
import '../models/todo_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart';

class UsersProvider with ChangeNotifier {
  late FirebaseUserAPI firebaseService;
  // late Stream<QuerySnapshot> _todosStream;
  // Todo? _selectedTodo;

  UsersProvider() {
    firebaseService = FirebaseUserAPI();
  }

  // getter
  // Stream<QuerySnapshot> get todos => _todosStream;
  // Todo get selected => _selectedTodo!;

  // changeSelectedTodo(Todo item) {
  //   _selectedTodo = item;
  // }

  // void fetchTodos() {
  //   _todosStream = firebaseService.getAllTodos();
  //   notifyListeners();
  // }

  void addUser(User user) async {
    String message = await firebaseService.addUser(user.toJson(user));
    print(message);
    notifyListeners();
  }

  // void editTodo(int index, String newTitle) {
  //   // _todoList[index].title = newTitle;
  //   print("Edit");
  //   notifyListeners();
  // }

  // void deleteTodo() async {
  //   String message = await firebaseService.deleteTodo(_selectedTodo!.id);
  //   print(message);
  //   notifyListeners();
  // }

  // void toggleStatus(int index, bool status) {
  //   // _todoList[index].completed = status;
  //   print("Toggle Status");
  //   notifyListeners();
  // }
}
