import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserAccountPage extends StatelessWidget {
  void signuserout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage:
                  NetworkImage('https://cdn-icons-png.flaticon.com/512/10337/10337609.png'),
            ),
            SizedBox(height: 16),
            Text(
              'John Doe',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Music enthusiast and coffee lover'),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Handle logout
                signuserout();
              },
              child: Text('Logout'),
            ),
            SizedBox(height: 16),
            Text('Premium Subscription: Active'),
            SizedBox(height: 24),
            // Add more widgets for favorites, playlists, and settings
          ],
        ),
      ),
    );
  }
}
