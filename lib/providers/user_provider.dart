// user_provider.dart
import 'package:flutter/material.dart';
import 'package:contador/models/user_model.dart';

class UserProvider with ChangeNotifier {
  UserModel? _user;

  UserModel? get user => _user;

  void setUser(UserModel newUser) {
    _user = newUser;
    notifyListeners();
  }

  bool signup(String username, String password) {
    if (username.isNotEmpty && password.isNotEmpty) {
      final newUser = UserModel(username: username, password: password);
      setUser(newUser); // Define o usuário em memória
      return true; // Cadastro bem-sucedido
    }
    return false; // Cadastro falhou (dados em branco)
  }

  bool login(String username, String password) {
    final storedUser = user; // Obtém o usuário armazenado em memória

    if (storedUser != null && storedUser.username == username && storedUser.password == password) {
      return true; // Autenticação bem-sucedida
    }
    return false; // Autenticação falhou
  }

  bool isLoggedIn() {
    return _user != null;
  }

  void logout() {
    _user = null;
    notifyListeners();
  }
}
