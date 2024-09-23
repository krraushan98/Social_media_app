import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/api/api_services.dart';
import 'package:social_media/models/post_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiServices apiServices = Get.put(ApiServices());

@override
  void initState() {
    super.initState();
    apiServices.fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Obx(() {
          //print("Data fetched from home+${apiServices.posts}");
          if (apiServices.posts.isEmpty) {
            return const CircularProgressIndicator();
          } else {
            return ListView.builder(
                itemCount: apiServices.posts.length,
                itemBuilder: (context, index) {
                  Post post = apiServices.posts[index];
                  return PostCard(post: post);
                });
          }
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/uploadPost');
        },
        child: const Icon(Icons.add, size: 30, ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class PostCard extends StatelessWidget {
  final Post post;
  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/postDetails', arguments: post);
      },
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(image: NetworkImage(post.thumbnailUrl)),
              const SizedBox(height: 8),
              Text(
                post.title,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        
        ),
      ),
    );
  }
}
