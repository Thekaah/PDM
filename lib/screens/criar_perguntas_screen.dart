import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class CreateQuestionScreen extends StatefulWidget {
  @override
  _CreateQuestionScreenState createState() => _CreateQuestionScreenState();
}

class _CreateQuestionScreenState extends State<CreateQuestionScreen> {
  final TextEditingController questionController = TextEditingController();
  final TextEditingController option1Controller = TextEditingController();
  final TextEditingController option2Controller = TextEditingController();
  final TextEditingController option3Controller = TextEditingController();

  Future<void> createQuestion() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    if (token == null) {
      // Tratar o caso em que o token não está disponível
      print('Token não disponível');
      return;
    }

    final String apiUrl = 'http://172.20.10.2:3001/api/questions';

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'question': questionController.text,
        'options': [
          option1Controller.text,
          option2Controller.text,
          option3Controller.text,
        ],
      }),
    );

    if (response.statusCode == 201) {
      // Pergunta criada com sucesso
      print('Pergunta criada com sucesso!');
      // Adicione qualquer navegação ou feedback que você deseja
    } else {
      // Exiba uma mensagem de erro se a criação da pergunta falhar
      print('Falha ao criar pergunta. Status code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar Pergunta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: questionController,
              decoration: InputDecoration(labelText: 'Pergunta'),
            ),
            TextField(
              controller: option1Controller,
              decoration: InputDecoration(labelText: 'Alternativa 1'),
            ),
            TextField(
              controller: option2Controller,
              decoration: InputDecoration(labelText: 'Alternativa 2'),
            ),
            TextField(
              controller: option3Controller,
              decoration: InputDecoration(labelText: 'Alternativa 3'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: createQuestion,
              child: Text('Criar Pergunta'),
            ),
          ],
        ),
      ),
    );
  }
}
