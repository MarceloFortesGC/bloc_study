import 'dart:convert';

class TaskModel {
  String title;
  TaskModel({
    required this.title,
  });

  TaskModel copyWith({
    String? title,
  }) {
    return TaskModel(
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return {'title': title};
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(title: map['title'] ?? '');
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) =>
      TaskModel.fromMap(json.decode(source));

  @override
  String toString() => 'TaskModel(title: $title)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TaskModel && other.title == title;
  }

  @override
  int get hashCode => title.hashCode;
}
