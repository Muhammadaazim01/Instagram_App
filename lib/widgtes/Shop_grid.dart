import 'package:flutter/material.dart';

class Shop_Grid extends StatelessWidget {
  final List<String> Shopgrid;

  const Shop_Grid({super.key, required this.Shopgrid});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: Shopgrid.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemBuilder: (context, index) {
        return Image.asset(
          Shopgrid[index],
          fit: BoxFit.cover,
        );
      },
    );
  }
}
