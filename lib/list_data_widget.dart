import 'package:flutter/material.dart';

Widget listDataWidget(task, Function(bool?) onChanged) {
  if (task == null) {
    return const SizedBox.shrink(); // Return an empty widget if task is null
  }
  return ListTile(
    leading: Checkbox(
      value: task['enabled'],
      onChanged: onChanged,
    ),
    title: Text(
      task['title'],
      style: TextStyle(
        decoration: task['enabled'] ? TextDecoration.lineThrough : null,
      ),
    ),
    subtitle: Row(
      children: [
        Text(task['category']),
        const SizedBox(width: 10),
        Text(task['date']),
      ],
    ),
    trailing: const Icon(
      Icons.remove_circle_outline,
      color: Colors.red,
    ),
  );
}
