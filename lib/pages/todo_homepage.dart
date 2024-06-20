import 'package:expensemanager/database/todo_database.dart';
import 'package:flutter/material.dart';

class TodoHomepage extends StatefulWidget {
  const TodoHomepage({Key? key}) : super(key: key);

  @override
  State<TodoHomepage> createState() => _TodoHomepageState();
}

class _TodoHomepageState extends State<TodoHomepage> {
  late List<TodoItem> todoItems;
  late TodoDatabase database;

  @override
  void initState() {
    super.initState();
    todoItems = [];
    database = TodoDatabase.instance;
    _loadTasks();
  }

  void _loadTasks() async {
    List<TodoItem> tasks = await database.getTasks();
    setState(() {
      todoItems = tasks;
    });
  }

  void _addNewTask(BuildContext context) async {
    TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Add New Task"),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'Enter task name'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.black),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                String taskName = controller.text;
                if (taskName.isNotEmpty) {
                  await database.insertTask(taskName, false);
                  _loadTasks();
                }
                Navigator.of(context).pop();
              },
              child: const Text('Add', style: TextStyle(color: Colors.white)),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.grey.shade900),
                elevation: MaterialStateProperty.all<double>(0),
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.grey.shade800;
                    }
                    return null;
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _toggleTaskCompletion(int index, bool completed) async {
    TodoItem updatedTask = todoItems[index]
        .copyWith(completed: !completed); // Toggle completion status
    await database.updateTask(updatedTask);
    _loadTasks();
  }

  @override
  Widget build(BuildContext context) {
    List<TodoItem> completedTasks =
        todoItems.where((task) => task.completed).toList();
    List<TodoItem> incompleteTasks =
        todoItems.where((task) => !task.completed).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Todo List',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.normal, // Reduced boldness
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.grey.shade900,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTaskList(incompleteTasks, false),
          _buildTaskList(completedTasks, true),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addNewTask(context);
        },
        backgroundColor: Colors.grey.shade900,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildTaskList(List<TodoItem> tasks, bool isCompleted) {
    return tasks.isEmpty
        ? SizedBox.shrink()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isCompleted) // Only show title for completed tasks
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Completed Tasks',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal, // Reduced boldness
                      color:
                          Colors.black, // Black title color for completed tasks
                    ),
                  ),
                ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return _buildTaskTile(tasks[index]);
                },
              ),
            ],
          );
  }

  Widget _buildTaskTile(TodoItem task) {
    return ListTile(
      title: Text(
        task.name,
        style: TextStyle(
          decoration: task.completed ? TextDecoration.lineThrough : null,
        ),
      ),
      leading: Checkbox(
        value: task.completed,
        onChanged: (isChecked) {
          _toggleTaskCompletion(todoItems.indexOf(task), task.completed);
        },
        fillColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            // Change checkbox color based on completion status
            if (task.completed) {
              return Colors.grey.shade900;
            } else {
              return Colors.white;
            }
          },
        ),
        checkColor: Colors.white,
      ),
    );
  }
}
