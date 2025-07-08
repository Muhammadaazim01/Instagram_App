import 'package:flutter/material.dart';

class PostGrid extends StatelessWidget {
  final List<String> postimages;
  const PostGrid({super.key, required this.postimages});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      itemCount: postimages.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
      ),
      itemBuilder: (context, index) {
        return Image.asset(
          postimages[index],
          fit: BoxFit.cover,
        );
      },
    );
  }
}
