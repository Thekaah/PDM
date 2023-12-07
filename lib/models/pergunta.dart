// models/pergunta.dart
class Pergunta {
  int? id;
  String perguntaText;
  int userId; // ID do usuário que criou a pergunta

  Pergunta({this.id, required this.perguntaText, required this.userId});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'perguntaText': perguntaText,
      'userId': userId,
    };
  }
}