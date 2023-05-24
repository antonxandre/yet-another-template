//TODO! mover response para um e importar todos
import 'package:yet_another_template/data/model/todo_model.dart';

import '../../core/services/response.dart';
import '../../data/services/todo_service.dart';

class TodoController extends TodoService {
  getAllTodo() async {
    // Some logic here
    final response = await findAll();

    print(response);
    switch (response) {
      case Success _:
        print('sucesso, response ${response.data}');
      case Failure _:
        print('falha: ${response.message}');
    }
  }

  createNewTodo() async {
    final TodoModel model = TodoModel(id: 'teste', title: 'title', done: false);
    final response = await create(model);
    print(response);
    switch (response) {
      case Success _:
        print('sucesso, response ${response.data}');
      case Failure _:
        print('falha: ${response.message}');
    }
  }

  updateTodo() async {
    final TodoModel model = TodoModel(
        id: '646d6126786dbb03e878bc3d', title: 'alterado', done: true);
    final response = await update(model.id, model);
    print(response);
    switch (response) {
      case Success _:
        print('sucesso, response ${response.data}');
      case Failure _:
        print('falha: ${response.message}');
    }
  }

  deleteTodo() async {
    final TodoModel(:id) =
        TodoModel(id: '646d7de7786dbb03e878bc67', title: 'title', done: false);
    final response = await delete(id);

    print(response);
    switch (response) {
      case Success _:
        print('sucesso, response ${response.data}');
      case Failure _:
        print('falha: ${response.message}');
    }
  }
}
