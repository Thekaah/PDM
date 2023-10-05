import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contador/providers/user_provider.dart';

class SignupScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Account'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/Icon.png',
                width: 100,
                height: 100,
              ),
              Text(
                'Welcome to Lafyuu',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Create a new account',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(Icons.email, color: Colors.blue),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: 'Your User',
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.lock, color: Colors.blue),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                      ),
                      obscureText: true,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final username = _usernameController.text;
                  final password = _passwordController.text;
                  final userProvider = Provider.of<UserProvider>(context, listen: false);

                  if (userProvider.signup(username, password)) {
                    Navigator.pushNamed(context, '/login');
                  } else {
                    // Exibir mensagem de erro, se necessário
                  }
                },
                child: Text('Submit!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
