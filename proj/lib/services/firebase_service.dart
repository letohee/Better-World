import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Get current user ID safely
  String? get userId => _auth.currentUser?.uid;

  Future<void> updateCurrentCharity(String charityTitle) async {
    if (userId == null) return;
    DocumentReference userDoc = _firestore.collection('users').doc(userId);
    await userDoc.update({'currentCharityGoal': charityTitle});
    print("Current charity updated to: $charityTitle");
  }

  // Fetch user data
  Future<Map<String, dynamic>?> getUserData() async {
    try {
      if (userId == null) {
        print("Error: User is not logged in");
        return null;
      }

      DocumentSnapshot userDoc = await _firestore.collection('users').doc(userId).get();
      if (userDoc.exists) {
        return userDoc.data() as Map<String, dynamic>;
      } else {
        print("Error: No user document found in Firestore");
      }
    } catch (e) {
      print("Error fetching user data: $e");
    }
    return null;
  }

  // Update Subscription Plan
  Future<void> updateSubscriptionPlan(String plan) async {
    try {
      if (userId == null) {
        print("Error: User is not logged in");
        return;
      }

      DocumentReference userDoc = _firestore.collection('users').doc(userId);
      await userDoc.update({'subscriptionPlan': plan});
      print("Subscription updated to: $plan");
    } catch (e) {
      print("Error updating subscription plan: $e");
    }
  }

  // Update User Points After Watching an Ad
  Future<void> updateUserPoints(int points) async {
    try {
      if (userId == null) {
        print("Error: User is not logged in");
        return;
      }

      DocumentReference userDoc = _firestore.collection('users').doc(userId);
      await userDoc.update({
        'userPoints': FieldValue.increment(points),
      });

      print("User points increased by: $points");
    } catch (e) {
      print("Error updating user points: $e");
    }
  }
}
