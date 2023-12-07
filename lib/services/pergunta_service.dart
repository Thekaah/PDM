// service/pergunta_service.dart
import 'package:shared_preferences/shared_preferences.dart';

class PerguntaService {
  Future<void> salvarPergunta(String pergunta, String alternativa1, String alternativa2, String alternativa3) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Obter perguntas existentes
    List<String>? perguntas = prefs.getStringList('perguntas') ?? [];

    // Adicionar nova pergunta à lista
    String novaPergunta = '$pergunta;$alternativa1;$alternativa2;$alternativa3';
    perguntas.add(novaPergunta);

    // Salvar a lista atualizada
    await prefs.setStringList('perguntas', perguntas);
  }

  Future<List<List<String>>> obterPerguntas() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Obter perguntas existentes
    List<String>? perguntas = prefs.getStringList('perguntas') ?? [];

    // Converter strings em listas
    List<List<String>> listaPerguntas = perguntas.map((pergunta) => pergunta.split(';')).toList();

    return listaPerguntas;
  }
}
