//new account

import "package:firebase_auth/firebase_auth.dart";
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'login.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() {
    return _RegisterScreenState();
  }
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _register() {
    // Perform your account registration logic here
    String email = _emailController.text;
    String username = _usernameController.text;
    String password = _passwordController.text;

    // Example: Create a new account and navigate to the login screen
    // You should implement your own logic for account creation and storage
    createAccount(email, username, password);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  void createAccount(String email, String username, String password) {
    // Implement your account creation logic here
    // You can store the account information in a database or use a service like Firebase
    // For this example, we'll just print the information
    if (kDebugMode) {
      print('New Account Created:');
      print('Email: $email');
      print('Username: $username');
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Account')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _register,
              child: const Text('Create Account'),
            ),
          ],
        ),
      ),
    );
  }
}
