import 'package:flutter/material.dart';
import 'edit_profile_page.dart';
import 'subscription_page.dart';
import 'sign_in_page.dart';
import '../services/auth_service.dart';

class SettingsPage extends StatelessWidget {
  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: ListView(
        children: [
          _buildSettingsSection("Account", [
            _buildSettingsTile(context, "Edit Profile", Icons.person, () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfilePage()));
            }),
            _buildSettingsTile(context, "Manage Subscription", Icons.subscriptions, () async {
              bool? updated = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SubscriptionPage()),
              );

              if (updated == true) {
                Navigator.pop(context, true); // refresh
              }
            }),
            _buildSettingsTile(context, "Logout", Icons.exit_to_app, () async {
              await authService.signOut();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => SignInPage()),
                    (route) => false, // clears the stack
              );
            }),
          ]),
          _buildSettingsSection("Preferences", [
            _buildSettingsTile(context, "Currency Selection", Icons.attach_money, () {}),
          ]),
          _buildSettingsSection("Security & Legal", [
            _buildSettingsTile(context, "Delete Account", Icons.delete, () {}),
            _buildSettingsTile(context, "Terms & Conditions", Icons.article, () {}),
          ]),
        ],
      ),
    );
  }

  Widget _buildSettingsSection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        Column(children: items),
        Divider(thickness: 1),
      ],
    );
  }

  Widget _buildSettingsTile(BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }
}
