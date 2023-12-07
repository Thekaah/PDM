import 'package:flutter/material.dart';
import '../models/question.dart';
import '../services/question_service.dart';

class PerguntasCriadasScreen extends StatefulWidget {
  @override
  _PerguntasCriadasScreenState createState() => _PerguntasCriadasScreenState();
}

class _PerguntasCriadasScreenState extends State<PerguntasCriadasScreen> {
  late Future<List<Question>> futureQuestions;

  @override
  void initState() {
    super.initState();
    futureQuestions = QuestionService().fetchQuestions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perguntas Criadas'),
      ),
      body: FutureBuilder<List<Question>>(
        future: futureQuestions,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Falha ao carregar perguntas. ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text('Nenhuma pergunta criada.'),
            );
          } else {
            List<Question> questions = snapshot.data!;
            return ListView.builder(
              itemCount: questions.length,
              itemBuilder: (context, index) {
                Question question = questions[index];
                return ListTile(
                  title: Text(question.question),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Criada por: ${question.userName}'),
                      Text('Opções: ${question.options.join(', ')}'),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
