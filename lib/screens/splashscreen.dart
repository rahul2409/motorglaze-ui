import 'package:flutter/material.dart';
import 'package:memberships_ui/screens/admin/add_store.dart';
import 'package:memberships_ui/screens/admin/add_user.dart';
import 'package:memberships_ui/screens/hidden_drawer.dart';
import 'package:memberships_ui/screens/customer/homescreen.dart';
import 'package:memberships_ui/screens/loginscreen.dart';

/*
This page will keep the user context and will make the changes to the screens based on user privileges. 
If the user is admin then it will locate it to /addstore route. Otherwise, if the privilege is store owner it will return His store page. 
For a user it will return the homescreen as shown in the application.
 */

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
      "privilege": "customer"
    };
    List<Widget> children = [HiddenDrawer(session)];
    //session = true;
    if (session.isEmpty) {
      return LoginScreen();
    } else {
      if (session["privilege"]?.toLowerCase() == "admin") {
        children.add(const AddStores());
      } else if (session["privilege"]?.toLowerCase() == "store owner") {
        children.add(const AddUsers());
      } else {
        children.add(const HomeScreen());
      }
      //title: 'Hello! Home page'
      return Scaffold(
        body: Stack(
          children: children,
        ),
      );
    }
  }
}
