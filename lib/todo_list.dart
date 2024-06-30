import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:expensemanager/pages/todo_homepage.dart';
import 'package:flutter/material.dart';

/// Entry point
void main() {
  runApp(const TodoList());
}

/// Root of the application.
class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const MainMenu(),
    );
  }
}

/// Main menu screen
class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  /// Initializes animation controller and starts the animation sequence.
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _controller.forward().whenComplete(() {
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const TodoHomepage()),
        );
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Builds main menu screen with an animated text widget.
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
              TypewriterAnimatedText(
                'To-Do List',
                textStyle: const TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
            totalRepeatCount: 1,
            onFinished: () {},
          ),
        ),
      ),
    );
  }
}
