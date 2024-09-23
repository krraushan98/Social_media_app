import 'package:get/get.dart';
import 'package:dio/dio.dart';
import '../models/post_model.dart';
import '../models/comment_model.dart';
import '../models/user_model.dart';
import '../exceptions/app_exception.dart';

class ApiServices extends GetxController {
  ApiServices._();

  // Static instance of the class
  static final ApiServices _instance = ApiServices._();

  // Factory constructor
  factory ApiServices() {
    return _instance;
  }
  // Observable states
  var posts = <Post>[].obs;
  var comments = Rxn<Comment>();
  var user = Rxn<User>();
  var errorMessage = ''.obs;

  final dio = Dio();

  String uploadPostResponse = '';

  // Fetch posts from the API
  Future<void> fetchPosts() async {
    print('Fetching posts');
    try {
      final response = await dio.get("https://jsonplaceholder.org/posts");
      if (response.statusCode == 200) {
        posts.value = (response.data as List)
            .map((postJson) => Post.fromJson(postJson))
            .toList();

        //print("Data fetched+${posts}");
      } else {
        // print(response.statusCode);
        throw AppException("Failed to load posts");
      }
    } catch (e) {
      //print(e);
      errorMessage.value = 'Error in fetching posts: $e';
    }
  }

  // Fetch comments for a post
  Future<void> fetchComments(String postId) async {
    try {
      final response =
          await dio.get("https://jsonplaceholder.org/comments/$postId");
      if (response.statusCode == 200) {
        comments.value = Comment.fromJson(response.data);
        print('Comment fetched');
      } else {
        throw AppException("Failed to load comment");
      }
    } catch (e) {
      print(e);
      errorMessage.value = 'Error in fetching comment: $e';
    }
  }

  // Fetch user details by user id
  Future<void> fetchUserDetails(String userId) async {
    try {
      final response =
          await dio.get("https://jsonplaceholder.org/users/$userId");
      if (response.statusCode == 200) {
        user.value = User.fromJson(response.data);
      } else {
        throw AppException("Failed to load user details");
      }
    } catch (e) {
      errorMessage.value = 'Error in fetching user details: $e';
    }
  }

  // Upload a post
  Future<void> uploadPost(String title, String category, String content) async {
    try {
      final response =
          await dio.post("https://jsonplaceholder.org/posts", data: {
        'title': title,
        'category': category,
        'content': content,
      });
      if (response.statusCode == 201) {
        print('Post uploaded');
        uploadPostResponse = 'Post Uploaded Successfully';
      } else {
        throw AppException("Failed to upload post");
      }
    } catch (e) {
      errorMessage.value = 'Error in uploading post: $e';
    }
  }
}
