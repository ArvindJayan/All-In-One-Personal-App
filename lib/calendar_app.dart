import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

// Calendar app splash screen widget
class CalendarApp extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<CalendarApp> {
  @override
  void initState() {
    super.initState();
    // Delay to show splash screen for 2 seconds
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
              TypewriterAnimatedText('Calendar App'),
            ],
            totalRepeatCount: 1,
          ),
        ),
      ),
    );
  }
}
