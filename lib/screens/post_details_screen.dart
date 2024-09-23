import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:social_media/api/api_services.dart';
import 'package:social_media/models/post_model.dart';

class PostDetails extends StatefulWidget {
  const PostDetails({super.key});

  @override
  State<PostDetails> createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  final ApiServices apiServices = Get.put(ApiServices());
  final Post post = Get.arguments;

  @override
  void initState() {
    super.initState();
    print('Post ID: ${post.id}');
    apiServices.fetchComments(post.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Details'),
        actions: [
          IconButton(
            onPressed: () {
               Get.toNamed('/userProfile', arguments: post.id);
            },
            icon: const Icon(Icons.person_2_rounded, size: 40),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(
                post.imageUrl,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 10),
               SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                 child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text(post.title,
                     style: const TextStyle(
                       fontSize: 18,
                       fontWeight: FontWeight.bold,
                      ),
                     ),
                   ],
                 ),
               ),
               const Divider(),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Category: ${post.category}'),
                  Text('Status: ${post.status}'),
                ],
              ),
              const SizedBox(height: 10),
              Text('Published At: ${post.publishedAt}'),
              const SizedBox(height:  10),
              Text('Updated At: ${post.updatedAt}'),
              const SizedBox(height: 10),
              const Divider(),
              Text(post.content),
              const SizedBox(height: 15),
              const Divider(),
              const Text('Comments', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              CommentList(),
            ],
          ),
        ),
      ),
    );
  }
}

class CommentList extends StatelessWidget {
  final ApiServices apiServices = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (apiServices.comments.value == null) {
        return const CircularProgressIndicator();
      } else {
        final comment = apiServices.comments.value!;
        return Text(comment.comment); 
      }
    });
  }
}
