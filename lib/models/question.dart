class Question {
  final String id;
  final String userId;
  final String userName;
  final String question;
  final List<String> options;

  Question({
    required this.id,
    required this.userId,
    required this.userName,
    required this.question,
    required this.options,
  });

  // Se necessário, implemente um método 'fromJson' para converter JSON em Question
  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['_id'],
      userId: json['user']['id'],
      userName: json['user']['name'],
      question: json['question'],
      options: List<String>.from(json['options']),
    );
  }
}
