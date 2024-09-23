import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/api/api_services.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final id = Get.arguments;
  ApiServices apiServices = Get.put(ApiServices());

  @override
  void initState() {
    super.initState();
    print('User ID: $id');
    apiServices.fetchUserDetails(id.toString());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
             // margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 110),
              
              decoration: const BoxDecoration(
                borderRadius:  BorderRadius.all(Radius.circular(10)),
                color: Color.fromARGB(255, 236, 230, 230),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 240, 235, 235),
                    offset: Offset(0.0, 1.0),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child:Column(
                children: [
                  Obx(() {
                    if (apiServices.user.value == null) {
                      return const CircularProgressIndicator();
                    } else {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.person, size: 100),
                          const SizedBox(height: 10),
                          Text('Name: ${apiServices.user.value!.firstname} ${apiServices.user.value!.lastname}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text('Email: ${apiServices.user.value!.email}',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text('Phone: ${apiServices.user.value!.phone}',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text('Website: ${apiServices.user.value!.website}',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      );
                    }
                  }),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 140),
              margin: const EdgeInsets.only(top: 20),
              decoration: const BoxDecoration(
                borderRadius:  BorderRadius.all(Radius.circular(10)),
                color: Color.fromARGB(255, 236, 230, 230),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 240, 235, 235),
                    offset: Offset(0.0, 1.0),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
               // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Text('Address',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Obx(() {
                    if (apiServices.user.value == null) {
                      return const CircularProgressIndicator();
                    } else {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Street: ${apiServices.user.value!.address.street}',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text('Suite: ${apiServices.user.value!.address.suite}',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text('City: ${apiServices.user.value!.address.city}',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text('Zipcode: ${apiServices.user.value!.address.zipcode}',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      );
                    }
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}