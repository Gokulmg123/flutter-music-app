//import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lyrica/logincomponent/register.dart';
import 'package:lyrica/screens/login.dart';

class LoginOrregister extends StatefulWidget {
  const LoginOrregister({super.key});

  @override
  State<LoginOrregister> createState() => _LoginOrregisterState();
}

class _LoginOrregisterState extends State<LoginOrregister> {
  bool showLoginPage = true;
  void togglepage() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(
        onTap: togglepage,
      );
    } else {
      return Register(onTap: togglepage,);
    }
  }
}
