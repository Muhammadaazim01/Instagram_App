import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookmarkController extends GetxController {
  // screen-wise bookmarks
  var screenBookmarks = <String, Map<int, bool>>{}.obs;

  void toggleSave(String screen, int index) {
    screenBookmarks.putIfAbsent(screen, () => <int, bool>{});

    final currentMap = screenBookmarks[screen]!;
    currentMap[index] = !(currentMap[index] ?? false);
    screenBookmarks[screen] = Map<int, bool>.from(currentMap);

    if (currentMap[index] == true) {
      Get.snackbar(
        'Saved',
        'Item saved in $screen',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFF1c1c1e),
        colorText: Colors.white,
      );
    }
  }

  bool isSaved(String screen, int index) {
    return screenBookmarks[screen]?[index] ?? false;
  }

  void initializeList(int length) {
    screenBookmarks.putIfAbsent('FeedScreen', () {
      final map = <int, bool>{};
      for (int i = 0; i < length; i++) {
        map[i] = false;
      }
      return map;
    });
  }
}
