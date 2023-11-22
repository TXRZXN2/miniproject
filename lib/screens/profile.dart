import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ImagePicker picker = ImagePicker();
  File? path;

  void pickImage(ImageSource src) async {
    final XFile? pickedFile = await picker.pickImage(source: src);
    path = File(pickedFile!.path);
    setState(() {});
  }

  void chooseSrc() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Please choose Source Image"),
        content: Row(
          children: [
            IconButton(
              onPressed: () {
                pickImage(ImageSource.gallery);
                Navigator.pop(context);
              },
              icon: Icon(Icons.image),
            ),
            IconButton(
              onPressed: () {
                pickImage(ImageSource.camera);
                Navigator.pop(context);
              },
              icon: Icon(Icons.camera),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              chooseSrc();
            },
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
                image: path != null
                    ? DecorationImage(
                        image: FileImage(path!),
                        fit: BoxFit.cover,
                      )
                    : const DecorationImage(
                        image: NetworkImage(
                            'https://cdn-icons-png.flaticon.com/512/2815/2815428.png'),
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          ),
          TextButton(
              onPressed: () async {
                final pref = await SharedPreferences.getInstance();
                pref.clear();
                exit(0);
              },
              child: Text("Kill Task")),
        ],
      ),
    );
  }
}
