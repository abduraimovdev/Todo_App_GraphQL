class Todo {
  int? id;
  bool? isCompleted;
  DateTime? createdAt;
  bool? isPublic;
  String? title;
  String? userId;

  Todo({
    required this.id,
    required this.isCompleted,
    required this.createdAt,
    required this.isPublic,
    required this.title,
    required this.userId,
  });

  factory Todo.fromJson(Map<String, Object?> json) {
    return Todo(
      id: json['id'] != null ? json['id'] as int : null,
      isCompleted:
          json['is_completed'] != null ? json['is_completed'] as bool : null,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      isPublic: json['is_public'] != null ? json['is_public'] as bool : null,
      title: json['title'] != null ? json['title'] as String : null,
      userId: json['user_id'] != null ? json['user_id'] as String : null,
    );
  }

  Map<String, Object?> toJson() => {
        "id": id,
        "isCompleted": isCompleted,
        "createdAt": createdAt,
        "isPublic": isPublic,
        "title": title,
        "userId": userId,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Todo &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          isCompleted == other.isCompleted &&
          createdAt == other.createdAt &&
          isPublic == other.isPublic &&
          title == other.title &&
          userId == other.userId;

  @override
  int get hashCode =>
      id.hashCode ^
      isCompleted.hashCode ^
      createdAt.hashCode ^
      isPublic.hashCode ^
      title.hashCode ^
      userId.hashCode;

  @override
  String toString() {
    return 'Todo{id: $id, isCompleted: $isCompleted, createdAt: $createdAt, isPublic: $isPublic, title: $title, userId: $userId}';
  }
}
