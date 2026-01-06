import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../utils/theme.dart';
import 'home_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(BetterWorldApp());
}

class BetterWorldApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Better World',
      theme: appTheme,
      home: HomePage(), // Initial login/register page
    );
  }
}

