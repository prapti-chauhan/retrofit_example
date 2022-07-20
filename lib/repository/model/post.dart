class Post {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Post(
      {required this.id,
      required this.title,
      required this.userId,
      required this.completed});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      title: json['title'],
      id: json['id'],
      userId: json['userId'],
      completed: json['completed'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'userId': userId,
      'completed': completed,
    };
  }
}
