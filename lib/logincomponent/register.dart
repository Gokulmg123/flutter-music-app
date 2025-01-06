import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lyrica/logincomponent/button.dart';
import 'package:lyrica/logincomponent/component.dart';

class Register extends StatelessWidget {
  void Function()? onTap;
  Register({super.key, required this.onTap});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  void signuserup() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
  }
//sign in

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Icon(
                    Icons.lock,
                    size: 100,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'create account',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Component(
                    controller: emailController,
                    hintText: 'email',
                    obscureText: false,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Component(
                    controller: passwordController,
                    hintText: 'password',
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Component(
                    controller: passwordController,
                    hintText: 'confirm password',
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  myButton(
                    text: 'sign up',
                    ontap: signuserup,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 100),
                        child: Text('already have an account'),
                      ),
                      SizedBox(width: 4),
                      GestureDetector(
                        onTap: onTap,
                        child: Text(
                          'login now',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
