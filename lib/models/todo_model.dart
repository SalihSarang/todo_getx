class TodoModel {
  final String id;
  final String title;
  final String details;
  final bool isCompleted;

  TodoModel(
      {required this.id,
      required this.title,
      required this.details,
      required this.isCompleted});

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
        id: json['id'],
        title: json['title'],
        details: json['details'],
        isCompleted: json['isCompleted']);
  }

  TodoModel copyWith(
      {String? id, String? title, String? details, bool? isCompleted}) {
    return TodoModel(
        id: id ?? this.id,
        title: title ?? this.title,
        details: details ?? this.details,
        isCompleted: isCompleted ?? this.isCompleted);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'details': details,
      'isCompleted': isCompleted
    };
  }
}
