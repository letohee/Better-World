import 'package:flutter/material.dart';
import '../services/firebase_service.dart';

class SubscriptionPage extends StatelessWidget {
  final FirebaseService firebaseService = FirebaseService();

  void _selectPlan(BuildContext context, String plan) async {
    await firebaseService.updateSubscriptionPlan(plan);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$plan selected')));

    // back to settings page and refresh
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Manage Subscription')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Choose a Subscription Plan", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            _buildSubscriptionOption(context, "Free Plan", "Earn points by watching ads.", Colors.green),
            _buildSubscriptionOption(context, "Basic Plan", "Donate small amounts monthly.", Colors.blue),
            _buildSubscriptionOption(context, "Premium Plan", "Maximum contribution with exclusive benefits.", Colors.orange),
          ],
        ),
      ),
    );
  }

  Widget _buildSubscriptionOption(BuildContext context, String title, String description, Color color) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color)),
            SizedBox(height: 5),
            Text(description),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _selectPlan(context, title),
              child: Text("Select $title"),
            ),
          ],
        ),
      ),
    );
  }
}
