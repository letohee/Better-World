import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  bool isLoading = true;
  bool isSaving = false;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    String? userId = _auth.currentUser?.uid;
    if (userId == null) return;

    DocumentSnapshot userDoc = await _firestore.collection('users').doc(userId).get();
    if (userDoc.exists) {
      setState(() {
        nameController.text = userDoc['name'] ?? "";
        locationController.text = userDoc['location'] ?? "";
        isLoading = false;
      });
    }
  }

  Future<void> _saveChanges() async {
    String? userId = _auth.currentUser?.uid;
    if (userId == null) return;

    setState(() {
      isSaving = true;
    });

    try {
      await _firestore.collection('users').doc(userId).update({
        'name': nameController.text.trim(),
        'location': locationController.text.trim(),
      });

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Profile Updated Successfully!")));

      // Return to profile page
      Navigator.pop(context, true);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to update profile: $e")));
    } finally {
      setState(() {
        isSaving = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Profile')),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Name"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: locationController,
              decoration: InputDecoration(labelText: "Location"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: isSaving ? null : _saveChanges,
              child: isSaving ? CircularProgressIndicator() : Text("Save Changes"),
            ),
          ],
        ),
      ),
    );
  }
}

