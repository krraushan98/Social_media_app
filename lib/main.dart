import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/screens/home_screen.dart';
import 'routes/route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: Routes.routes,
    );
  }
}