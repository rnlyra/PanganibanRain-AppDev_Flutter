import 'package:flutter/material.dart';
import 'login_page.dart';

void main() {
  runApp(MyCVApp());
}

class MyCVApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My CV',
      theme: ThemeData(
        primaryColor: Colors.blue[700],
        scaffoldBackgroundColor: Colors.blue[50],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue[700],
          titleTextStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      home: LoginPage(),
    );
  }
}
