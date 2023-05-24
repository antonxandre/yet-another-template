// To parse this JSON data, do
//
//     final todoModel = todoModelFromJson(jsonString);

import 'dart:convert';

TodoModel todoModelFromJson(String str) => TodoModel.fromJson(json.decode(str));

String todoModelToJson(TodoModel data) => json.encode(data.toJson());

class TodoModel {
  String id;
  String title;
  bool done;

  TodoModel({
    required this.id,
    required this.title,
    required this.done,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        id: json["_id"],
        title: json["title"],
        done: json["done"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "done": done,
      };
}
