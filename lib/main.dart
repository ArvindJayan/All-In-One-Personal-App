import 'package:all_in_one_personal_app/calendar_app.dart';
import 'package:all_in_one_personal_app/database/expense_database.dart';
import 'package:all_in_one_personal_app/expense_manager.dart';
import 'package:all_in_one_personal_app/notes_app.dart';
import 'package:all_in_one_personal_app/todo_list.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Entry point
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the database
  await ExpenseDatabase.initialize();

  // Run the application
  runApp(
    ChangeNotifierProvider(
      create: (context) => ExpenseDatabase(),
      child: const MainApp(),
    ),
  );
}

// Main application widget
class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(), // Set the initial screen
    );
  }
}

// Splash screen widget
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Navigate to the main menu after a delay
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainMenu()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 233, 217, 246),
      body: Center(
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 107, 0, 195),
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText('All In One Personal App'),
            ],
            totalRepeatCount: 1,
          ),
        ),
      ),
    );
  }
}

// Main menu widget
class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(223, 105, 10, 206),
        title: const Text(
          'All In One Personal App',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 246, 242, 253),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(),
            // Calendar App button
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CalendarApp()),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                backgroundColor: Colors.white,
                foregroundColor: const Color.fromARGB(255, 111, 0, 202),
              ),
              icon: const Icon(
                Icons.calendar_today,
                size: 28,
              ),
              label: const Text('Calendar App'),
            ),
            const SizedBox(height: 20),
            // Expense Manager button
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ExpenseManager()),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                backgroundColor: Colors.white,
                foregroundColor: const Color.fromARGB(255, 111, 0, 202),
              ),
              icon: const Text(
                '₹',
                style: TextStyle(fontSize: 24),
              ),
              label: const Text('Expense Manager'),
            ),
            const SizedBox(height: 20),
            // To-Do List button
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TodoList()),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                backgroundColor: Colors.white,
                foregroundColor: const Color.fromARGB(255, 111, 0, 202),
              ),
              icon: const Icon(
                Icons.check_box,
                size: 28,
              ),
              label: const Text('To-Do List'),
            ),
            const SizedBox(height: 20),
            // Notes App button
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NotesApp()),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                backgroundColor: Colors.white,
                foregroundColor: const Color.fromARGB(255, 111, 0, 202),
              ),
              icon: const Icon(
                Icons.notes,
                size: 28,
              ),
              label: const Text('Notes App'),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
