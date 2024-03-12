class Post {
  final String id;
  final String title;
  final String body;
  final String userId;
  final String createdAt;
  final String updatedAt;

  Post({
    required this.id,
    required this.title,
    required this.body,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      userId: json['userId'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
