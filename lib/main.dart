import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagramclone/Screens/UserProfile.dart';
import 'package:instagramclone/controllers/book_mark_controller.dart';

void main() {
  Get.put(BookmarkController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Profile_Screen(),
    );
  }
}
