import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'criar_perguntas_screen.dart';
import 'login_screen.dart';
import 'perguntas_criadas_screen.dart';

class HomeScreen extends StatelessWidget {
  Future<void> _logout(BuildContext context) async {
    // Limpar os dados salvos no storage
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();

    // Navegar para a tela de login
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
          (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Olá Administrador! Seja bem-vindo!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PerguntasCriadasScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: Text('Visualizar Perguntas'),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Navegar para a página de Criar Perguntas
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateQuestionScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: Text('Criar Perguntas'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Deslogar: Navegar para a tela de login e limpar dados do storage
                      _logout(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: Text('Deslogar'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
