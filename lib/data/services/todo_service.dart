import 'package:yet_another_template/core/services/http_service.dart';
import 'package:yet_another_template/data/model/todo_model.dart';

class TodoService extends HttpServiceImpl<TodoModel> {
  TodoService()
      : super('https://crudcrud.com/api/e9dd92f2406c4fcfa1933b17cb07ade6/todo');

  @override
  TodoModel fromJson(Map<String, dynamic> json) => TodoModel.fromJson(json);

  @override
  Map<String, dynamic> toJson(TodoModel model) => model.toJson();
}
