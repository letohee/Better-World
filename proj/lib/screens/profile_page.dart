import 'package:flutter/material.dart';
import '../services/firebase_service.dart';
import 'edit_profile_page.dart';
import 'settings_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();

}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseService firebaseService = FirebaseService();
  Map<String, dynamic>? userData;
  bool isLoading = true;
  bool isError = false;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      Map<String, dynamic>? data = await firebaseService.getUserData();
      if (data != null) {
        setState(() {
          userData = data;
          isLoading = false;
        });
      } else {
        setState(() {
          isError = true;
          isLoading = false;
        });
      }
    } catch (e) {
      print("Error fetching user data: $e");
      setState(() {
        isError = true;
        isLoading = false;
      });
    }
  }

  Future<void> _navigateToEditProfile() async {
    bool? updated = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditProfilePage()),
    );

    if (updated == true) {
      fetchUserData();
    }
  }

  Future<void> _navigateToSettings() async {
    bool? updated = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SettingsPage()),
    );

    if (updated == true) {
      fetchUserData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: _navigateToSettings,
          ),
        ],
      ),

      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : isError
          ? Center(child: Text("Error loading profile. Try again later."))
          : SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Picture
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(userData!['profilePicture'] ?? "assets/avatar.jpg"),
            ),
            SizedBox(height: 10),

            // User Name
            Text(
              userData!['name'],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            // Location
            Text(
              userData!['location'],
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 20),

            // points section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatItem("Points", userData!['userPoints'].toString()),
                _buildStatItem("Contributions", "\$${userData!['paidContributions'].toStringAsFixed(2)}"),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              icon: Icon(Icons.refresh),
              label: Text('Refresh Profile'),
              onPressed: fetchUserData,
            ),

            // charity plan selected
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                leading: Icon(Icons.subscriptions, color: Colors.blue),
                title: Text('Subscription Plan'),
                subtitle: Text(userData!['subscriptionPlan']),
              ),
            ),
            SizedBox(height: 20),

            // charity goal
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Current Charity Goal',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(userData!['currentCharityGoal']),
                    SizedBox(height: 10),
                    LinearProgressIndicator(
                      value: userData!['charityGoalReached'] / 100,
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                    SizedBox(height: 5),
                    Text('${userData!['charityGoalReached']}% Reached'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // edit prof button
            ElevatedButton.icon(
              onPressed: _navigateToEditProfile,
              icon: Icon(Icons.edit),
              label: Text('Edit Profile'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }

}
