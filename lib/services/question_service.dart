// services/question_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/question.dart';

class QuestionService {
  Future<List<Question>> fetchQuestions() async {
    try {
      final response = await http.get(Uri.parse('http://172.20.10.2:3001/api/questionsget'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        print('Dados brutos recebidos: $data');

        return data.map((questionData) {
          print('Dados da pergunta antes do mapeamento: $questionData');

          final dynamic userData = questionData['user'];
          final String userId = userData is Map ? userData['id'] : userData;
          final String userName = userData is Map ? userData['name'] : '';

          return Question(
            id: questionData['_id'],
            userId: userId,
            userName: userName,
            question: questionData['question'],
            options: List<String>.from(questionData['options']),
          );
        }).toList();
      } else {
        throw Exception('Failed to load questions');
      }
    } catch (error) {
      print('Erro ao buscar perguntas: $error');
      throw error;
    }
  }

  Future<void> createQuestion(Question question) async {
    final String apiUrl = 'http://172.20.10.2:3001/api/questions';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'question': question.question,
          'options': question.options,
          'user': {
            'id': question.userId,
            'name': question.userName,
          },
        }),
      );

      if (response.statusCode == 201) {
        // Pergunta criada com sucesso
      } else {
        print('Erro ao criar pergunta: ${response.statusCode}');
        throw Exception('Failed to create question');
      }
    } catch (error) {
      print('Erro ao criar pergunta: $error');
      throw error;
    }
  }
}
