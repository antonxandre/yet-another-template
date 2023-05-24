import 'package:flutter/material.dart';
import 'package:yet_another_template/presentation/state_management/todo_controller.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  late final TodoController todoController;
  @override
  void initState() {
    super.initState();
    todoController = TodoController();
    todoController.getAllTodo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo')),
      body: Column(
        children: [
          Text('something here...'),
          ElevatedButton(
            onPressed: () {
              todoController.createNewTodo();
            },
            child: Text('create'),
          ),
          ElevatedButton(
            onPressed: () {
              todoController.updateTodo();
            },
            child: Text('update'),
          ),
          ElevatedButton(
            onPressed: () {
              todoController.deleteTodo();
            },
            child: Text('delete'),
          ),
        ],
      ),
    );
  }
}
