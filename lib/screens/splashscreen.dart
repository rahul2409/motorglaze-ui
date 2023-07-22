import 'package:flutter/material.dart';
import 'package:memberships_ui/hidden_drawer.dart';
import 'package:memberships_ui/screens/homescreen.dart';
import 'package:memberships_ui/screens/loginscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    var session = {
      "id": "abcdefghijkl",
      "firstName": "Rahul",
      "lastName": "Nandrajog",
      "email": "rahulnandrajog99@gmail.com",
      "privilege": "Admin"
    };
    //session = true;
    if (session == null) {
      return LoginScreen();
    } else {
      //title: 'Hello! Home page'
      return const Scaffold(
        body: Stack(
          children: [HiddenDrawer(), HomeScreen()],
        ),
      );
    }
  }
}
