import 'package:flutter/material.dart';

class ReelGrid extends StatelessWidget {
  final List<String> gridimages;
  const ReelGrid({super.key, required this.gridimages});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      itemCount: gridimages.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
      ),
      itemBuilder: (context, index) {
        return Image.asset(
          gridimages[index],
          fit: BoxFit.cover,
        );
      },
    );
  }
}
