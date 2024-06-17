import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'pages/home_page.dart';

class ExpenseManager extends StatefulWidget {
  const ExpenseManager({Key? key}) : super(key: key);

  @override
  _ExpenseManagerState createState() => _ExpenseManagerState();
}

class _ExpenseManagerState extends State<ExpenseManager>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

    _controller.forward().whenComplete(() {
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: DefaultTextStyle(
            style: const TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText('Expense Manager'),
              ],
              totalRepeatCount: 1,
            ),
          ),
        ),
      ),
    );
  }
}
