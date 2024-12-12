import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfilePicture extends StatelessWidget {
  final File? profileImage;
  final Function(File) onImageSelected;

  const ProfilePicture({
    Key? key,
    required this.profileImage,
    required this.onImageSelected,
  }) : super(key: key);

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      onImageSelected(File(pickedFile.path));  // Notify the parent widget
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,  // When tapped, open image picker
      child: CircleAvatar(
        radius: 50,
        backgroundImage: profileImage != null
            ? FileImage(profileImage!) // Display selected image if available
            : AssetImage('assets/default_pfp.png') as ImageProvider,
        child: profileImage == null
            ? Icon(Icons.add_a_photo, size: 20, color: Colors.white)  // Icon when no image is selected
            : null,
      ),
    );
  }
}
