import 'package:flutter/material.dart';
import 'package:contador/providers/user_provider.dart';
import 'package:contador/screens/main_screen.dart';
import 'package:provider/provider.dart';
import 'package:contador/screens/login_screen.dart';
import 'package:contador/screens/signup_screen.dart';
import 'package:contador/screens/explore_screen.dart';
import 'package:contador/screens/offer_screen.dart';
import 'package:contador/screens/profile_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => MainScreen(),
          '/login': (context) => LoginScreen(),
          '/signup': (context) => SignupScreen(),
          '/explore': (context) => ExploreScreen(),
          '/offer': (context) => OfferScreen(),
          '/profile': (context) => ProfileScreen(),
        },
      ),
    );
  }
}
