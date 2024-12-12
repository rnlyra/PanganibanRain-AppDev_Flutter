import 'package:flutter/material.dart';
import 'profile_picture.dart';
import 'dart:io';

class CVScreen extends StatefulWidget {
  @override
  _CVScreenState createState() => _CVScreenState();
}

class _CVScreenState extends State<CVScreen> {
  File? profileImage; // Store the profile image

  // Function to update profile image
  void _onImageSelected(File image) {
    setState(() {
      profileImage = image; // Update the profile image when selected
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My CV'),
        backgroundColor: Colors.blue[700],
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer(); // Open drawer on menu button press
            },
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue[700]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Add a Fixed Height for the Profile Picture Section
                  Container(
                    height: 90,
                    child: ProfilePicture(
                      profileImage: profileImage, // Pass the selected image
                      onImageSelected: _onImageSelected, // Pass the image change function
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Rain',
                    style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.phone, color: Colors.blue),
              title: Text('+1 (555) 123-4567', style: TextStyle(fontSize: 16)),
            ),
            ListTile(
              leading: Icon(Icons.email, color: Colors.blue),
              title: Text('rnlyra@email.com', style: TextStyle(fontSize: 16)),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Professional Goal',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue[700]),
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.blue[50],
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'CV Sections',
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.blue[700]),
                ),
                SizedBox(height: 16),
                _buildCVSection('Education'),
                _buildCVSection('Skills'),
                _buildCVSection('Projects'),
                _buildCVSection('Experience'),
              ],
            ),
          ),
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
          Icon(Icons.circle, size: 10, color: Colors.blue[700]),
          SizedBox(width: 10),
          Flexible(
            child: Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.blue[700]),
            ),
          ),
        ],
      ),
    );
  }
}
