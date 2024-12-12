import 'package:flutter/material.dart';
import 'cv_screen.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Hardcoded credentials
  final String validUsername = "Rain";
  final String validPassword = "1245";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Welcome to My CV App',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue[700]),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
              obscureText: true,
            ),
            SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[700],
                padding: EdgeInsets.symmetric(vertical: 14),
              ),
              onPressed: () {
                final username = usernameController.text;
                final password = passwordController.text;

                // Check if the input matches the hardcoded credentials
                if (username == validUsername && password == validPassword) {
                  // Navigate to the CV screen if valid
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CVScreen()),
                  );
                } else {
                  // Show an error message if invalid
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Invalid credentials')),
                  );
                }
              },
              child: Text('Login', style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
