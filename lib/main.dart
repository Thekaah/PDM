// main.dart
import 'package:contador/screens/criar_perguntas_screen.dart';
import 'package:contador/screens/home_screen.dart';
import 'package:contador/screens/login_screen.dart';
import 'package:contador/screens/perguntas_criadas_screen.dart';
import 'package:contador/screens/register_screen.dart';
import 'package:contador/screens/criar_perguntas_screen.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seu Projeto',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => HomeScreen(),
        '/criar_perguntas': (context) => CreateQuestionScreen(),
        '/perguntas_criadas': (context) => PerguntasCriadasScreen(),
      },
    );
  }
}
