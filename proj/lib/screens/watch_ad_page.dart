import 'dart:async';
import 'package:flutter/material.dart';
import '../services/firebase_service.dart';

class WatchAdPage extends StatefulWidget {
  @override
  _WatchAdPageState createState() => _WatchAdPageState();
}

class _WatchAdPageState extends State<WatchAdPage> {
  final FirebaseService firebaseService = FirebaseService();
  int timerSeconds = 15;
  late Timer countdownTimer;
  bool canCollectPoints = false;
  bool isTimerRunning = false;

  @override
  void dispose() {
    if (isTimerRunning) countdownTimer.cancel();
    super.dispose();
  }

  void _startTimer() {
    setState(() {
      timerSeconds = 15;
      canCollectPoints = false;
      isTimerRunning = true;
    });

    countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timerSeconds > 0) {
        setState(() {
          timerSeconds--;
        });
      } else {
        timer.cancel();
        setState(() {
          canCollectPoints = true;
          isTimerRunning = false;
        });
      }
    });
  }

  Future<void> _claimPoints() async {
    await firebaseService.updateUserPoints(5);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("You earned 5 points!")),
    );
    // Reset everything after claiming
    setState(() {
      timerSeconds = 15;
      canCollectPoints = false;
      isTimerRunning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Watch Ad')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.ondemand_video, size: 100, color: Colors.blueAccent),
            SizedBox(height: 20),
            Text(
              "Watch Ads to Earn Points",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              "Click the button below to start earning points.\nTimer starts when pressed.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 40),

            // Unified button
            ElevatedButton(
              onPressed: () {
                if (canCollectPoints) {
                  _claimPoints();
                } else if (!isTimerRunning) {
                  _startTimer();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: canCollectPoints ? Colors.green : Colors.blue,
              ),
              child: Text(
                canCollectPoints
                    ? "Collect 5 Points"
                    : (isTimerRunning ? "Waiting... $timerSeconds s" : "Start Ad"),
              ),
            ),

            SizedBox(height: 40),
            Text(
              "Check your profile to see your updated points.",
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}
