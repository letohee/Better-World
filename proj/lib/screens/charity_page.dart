import 'package:flutter/material.dart';
import '../services/firebase_service.dart';

class CharityPage extends StatefulWidget {
  @override
  _CharityPageState createState() => _CharityPageState();
}

class _CharityPageState extends State<CharityPage> {
  final FirebaseService firebaseService = FirebaseService();

  // charity list (add firebase later)
  final List<Map<String, String>> charityOptions = [
    {
      'title': 'Saharan Water Aid',
      'description': 'Help children in the Saharan Desert get clean water.'
    },
    {
      'title': 'Education for All',
      'description': 'Support building schools in rural villages.'
    },
    {
      'title': 'Medical Aid for Yemen',
      'description': 'Provide urgent medical supplies to Yemen.'
    },
    {
      'title': 'Food for Gaza',
      'description': 'Deliver essential food supplies to families in Gaza.'
    },
  ];

  Future<void> _selectCharity(String charityTitle) async {
    await firebaseService.updateCurrentCharity(charityTitle);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Selected "$charityTitle" as your current charity')),
    );
    Navigator.pop(context); // Return to profile or previous page
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Choose a Charity")),
      body: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bac5.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Text(
                "Select a Charity to Support",
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: charityOptions.length,
              itemBuilder: (context, index) {
                final charity = charityOptions[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: Icon(Icons.favorite, color: Colors.red),
                    title: Text(charity['title']!),
                    subtitle: Text(charity['description']!),
                    trailing: ElevatedButton(
                      onPressed: () => _selectCharity(charity['title']!),
                      child: Text("Select"),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
