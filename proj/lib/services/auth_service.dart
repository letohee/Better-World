import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Register User and Save to Firestore
  Future<User?> register(String email, String password, String name) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = credential.user;

      if (user != null) {
        await _firestore.collection('users').doc(user.uid).set({
          "name": name,
          "email": email,
          "profilePicture": "assets/avatar.jpg",
          "location": "Not set",
          "subscriptionPlan": "Free Plan",
          "userPoints": 0,
          "paidContributions": 0.0,
          "currentCharityGoal": "None",
          "charityGoalReached": 0.0
        });
      }
      return user;
    } catch (e) {
      print("Error registering user: $e");
      return null;
    }
  }



// Sign out user
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Check if user is currently signed in
  User? get currentUser {
    return _auth.currentUser;
  }
}
