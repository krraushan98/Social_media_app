//post model
class Post {
  final int id;
  final String title;
  final String content;
  final String imageUrl;
  final String thumbnailUrl;
  final String status;
  final String category;
  final String publishedAt;
  final String updatedAt;

  Post({
    required this.id,
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.thumbnailUrl,
    required this.status,
    required this.category,
    required this.publishedAt,
    required this.updatedAt,
    });

  //factory method to convert json data to model
  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json['id'],
    title: json['title'],
    content: json['content'],
    imageUrl: json['image'] ?? '',
    thumbnailUrl: json['thumbnail'] ?? '',
    status: json['status'],
    category: json['category'],
    publishedAt: json['publishedAt'],
    updatedAt: json['updatedAt'],
  );
}