import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

// Habit Tracker splash screen widget
class HabitTracker extends StatefulWidget {
  @override
  _HabitTrackerState createState() => _HabitTrackerState();
}

class _HabitTrackerState extends State<HabitTracker> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText('Habit Tracker'),
            ],
            totalRepeatCount: 1,
          ),
        ),
      ),
    );
  }
}
