import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagramclone/controllers/book_mark_controller.dart';

class BookmarkButton extends StatelessWidget {
  final String screen;
  final int index;
  final double size;
  final Color activeColor;
  final Color inactiveColor;

  BookmarkButton({
    super.key,
    required this.screen,
    required this.index,
    this.size = 28,
    this.activeColor = Colors.white,
    this.inactiveColor = Colors.grey,
  });

  final BookmarkController controller = Get.find<BookmarkController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => IconButton(
          icon: Icon(
            controller.isSaved(screen, index)
                ? Icons.bookmark
                : Icons.bookmark_border_outlined,
            size: size,
            color:
                controller.isSaved(screen, index) ? activeColor : inactiveColor,
          ),
          onPressed: () => controller.toggleSave(screen, index),
        ));
  }
}
