import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lyrica/logincomponent/button.dart';
import 'package:lyrica/logincomponent/component.dart';

class LoginPage extends StatelessWidget {
  void Function()? onTap;
  LoginPage({super.key,required this.onTap});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  void signuserin() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
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
                    'welcome back',
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
                  myButton(
                    text: 'sign in',
                    ontap: signuserin,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [

                      const Padding(
                        padding: EdgeInsets.only(left: 100),
                        child: Text('Not a member'),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: onTap,
                        child: Text(
                          'register now',
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
