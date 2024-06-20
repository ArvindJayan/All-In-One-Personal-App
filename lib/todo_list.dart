import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

// To-Do List splash screen widget
class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: DefaultTextStyle(
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText('To-Do List'),
            ],
            totalRepeatCount: 1,
          ),
        ),
      ),
    );
  }
}
