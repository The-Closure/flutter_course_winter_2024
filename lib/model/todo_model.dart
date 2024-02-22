// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TodoModel {
  final String title;
  final String id;
  final bool completed;
  TodoModel({
    required this.title,
    required this.id,
    required this.completed,
  });

  TodoModel copyWith({
    String? title,
    String? id,
    bool? completed,
  }) {
    return TodoModel(
      title: title ?? this.title,
      id: id ?? this.id,
      completed: completed ?? this.completed,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'id': id,
      'completed': completed,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      title: map['title'] as String,
      id: map['id'] as String,
      completed: map['completed'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoModel.fromJson(String source) =>
      TodoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'TodoModel(title: $title, id: $id, completed: $completed)';

  @override
  bool operator ==(covariant TodoModel other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.id == id &&
        other.completed == completed;
  }

  @override
  int get hashCode => title.hashCode ^ id.hashCode ^ completed.hashCode;
}
