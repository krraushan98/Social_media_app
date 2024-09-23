import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:social_media/screens/home_screen.dart';
import 'package:social_media/screens/post_details_screen.dart';
import 'package:social_media/screens/uploadPost.dart';
import 'package:social_media/screens/user_profile_screen.dart';

class Routes {
static final routes = [
    GetPage(
      name: '/',
      page: () => HomeScreen(),
    ),
    GetPage(
      name: '/postDetails',
      page: () => PostDetails(),
      transition: Transition.zoom,
    ),
    GetPage(
      name: '/userProfile',
      page: () => UserProfile(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name:'/uploadPost',
      page: () => UploadPost(),
      transition: Transition.downToUp,
    )
  ];
}