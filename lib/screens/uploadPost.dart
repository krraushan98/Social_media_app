import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/api/api_services.dart';

class UploadPost extends StatefulWidget {
  const UploadPost({super.key});

  @override
  State<UploadPost> createState() => _UploadPostState();
}

class _UploadPostState extends State<UploadPost> {
  ApiServices apiServices = Get.put(ApiServices());
  TextEditingController _titleController = TextEditingController();
  TextEditingController _categoryController = TextEditingController();
  TextEditingController _contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: const Text('Upload Post'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  hintText: 'Enter Title',
                  labelText: 'Title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _categoryController,
                decoration: const InputDecoration(
                  hintText: 'Category',
                  labelText: 'Category',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _contentController,
                maxLines: 10,
                decoration: const InputDecoration(
                  hintText: 'Content',
                  labelText: 'Content',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  await apiServices.uploadPost(
                    _titleController.text,
                    _categoryController.text,
                    _contentController.text,
                  );
                  print(apiServices.uploadPostResponse);
                  if (apiServices.uploadPostResponse ==
                      'Post Uploaded Successfully') {
                    print('checking');
                    Get.offAllNamed('/');
                  }
                  else{
                    Get.snackbar('Error', 'Failed to upload post');
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  textStyle: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                child: const Text(
                  'Upload Post',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
