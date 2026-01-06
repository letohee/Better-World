import 'package:flutter/material.dart';
import 'charity_page.dart';
import 'gallery_page.dart';
import 'watch_ad_page.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to BetterWorld"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Text
            Text(
              "Welcome to BetterWorld!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Description Text
            Text(
              "BetterWorld is a charity app designed to help raise funds for people in need across the world. "
                  "You can contribute by viewing ads, donating, and much more.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            // more description
            Text(
              "Here's how you can help:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text("- Check out the Gallery to learn about current charity events.", style: TextStyle(fontSize: 16)),
            Text("- Donate through the Charity tab to support ongoing causes.", style: TextStyle(fontSize: 16)),
            Text("- Watch advertisements to earn points that can be used for donations.", style: TextStyle(fontSize: 16)),
            SizedBox(height: 30),
            // navigation to pages
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CharityPage()));
              },
              child: Text("Explore Charity Causes"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => GalleryPage()));
              },
              child: Text("View Charity Gallery"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => WatchAdPage()));
              },
              child: Text("Watch Ads to Earn Points"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            ),
          ],
        ),
      ),
    );
  }
}
