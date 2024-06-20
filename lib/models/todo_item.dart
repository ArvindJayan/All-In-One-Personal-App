class TodoItem {
  final int id;
  final String name;
  final bool completed;

  TodoItem({
    required this.id,
    required this.name,
    required this.completed,
  });

  TodoItem copyWith({
    int? id,
    String? name,
    bool? completed,
  }) {
    return TodoItem(
      id: id ?? this.id,
      name: name ?? this.name,
      completed: completed ?? this.completed,
    );
  }
}
