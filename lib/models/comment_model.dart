//comment model
class Comment {
  final int id;
  final int postId;
  final int userId;
  final String comment;

  Comment({
    required this.id,
    required this.postId,
    required this.userId,
    required this.comment,
  });

  //factory method to convert json data to model
  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json['id'],
        postId: json['postId'],
        userId: json['userId'],
        comment: json['comment'],
      );
}