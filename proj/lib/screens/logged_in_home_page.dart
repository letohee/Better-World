import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'gallery_page.dart';
import 'charity_page.dart';
import 'watch_ad_page.dart';
import 'profile_page.dart';


class LoggedInHomePage extends StatefulWidget {
  @override
  _LoggedInHomePageState createState() => _LoggedInHomePageState();
}

class _LoggedInHomePageState extends State<LoggedInHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    GalleryPage(),
    CharityPage(),
    WatchAdPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.photo_library), label: "Gallery"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Charity"),
          BottomNavigationBarItem(icon: Icon(Icons.ondemand_video), label: "Watch Ad"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
