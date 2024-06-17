import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class FitnessTracker extends StatefulWidget {
  @override
  _FitnessTrackerState createState() => _FitnessTrackerState();
}

class _FitnessTrackerState extends State<FitnessTracker> {
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
              TypewriterAnimatedText('Fitness Tracker'),
            ],
            totalRepeatCount: 1,
          ),
        ),
      ),
    );
  }
}
