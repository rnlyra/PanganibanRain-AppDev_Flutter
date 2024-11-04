import 'package:flutter/material.dart';

void main() {
  runApp(MyCVApp());
}

class MyCVApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My CV',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CVScreen(),
    );
  }
}

class CVScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My CV'),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.blue[100],
                    child: Text(
                      'RL',
                      style: TextStyle(fontSize: 24, color: Colors.blue),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Rain Lyrra',
                    style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('+1 (555) 123-4567'),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('rnlyra@email.com'),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Professional Goal',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'To utilize my skills and experience in software development to make impactful contributions to the field.',
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.blue[300],
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'CV Sections',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 16),
            _buildCVSection('Education'),
            _buildCVSection('Skills'),
            _buildCVSection('Projects'),
            _buildCVSection('Experience'),
          ],
        ),
      ),
    );
  }

  Widget _buildCVSection(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.circle, size: 12, color: Colors.grey),
          SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
