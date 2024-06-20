import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final ValueChanged<bool?> onChanged;

  const TodoTile({
    Key? key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskName,
        style: TextStyle(
          decoration: taskCompleted ? TextDecoration.lineThrough : null,
        ),
      ),
      leading: Checkbox(
        value: taskCompleted,
        onChanged: onChanged,
        fillColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            // Change checkbox color based on completion status
            if (taskCompleted) {
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
