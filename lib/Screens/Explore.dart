import 'package:flutter/material.dart';
import 'package:instagramclone/Funtional_icons/Suggestion_textfield.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  final List<String> images = [
    "assets/images/1.png",
    "assets/images/2.png",
    "assets/images/3.png",
    "assets/images/4.png",
    "assets/images/5.png",
    "assets/images/6.png",
    "assets/images/7.png",
    "assets/images/8.png",
    "assets/images/9.png",
    "assets/images/10.png",
    "assets/images/11.png",
    "assets/images/1.png",
    "assets/images/2.png",
    "assets/images/3.png",
    "assets/images/4.png",
    "assets/images/5.png",
    "assets/images/6.png",
    "assets/images/7.png",
    "assets/images/8.png",
    "assets/images/9.png",
    "assets/images/10.png",
    "assets/images/11.png",
    "assets/images/1.png",
    "assets/images/2.png",
    "assets/images/3.png",
    "assets/images/4.png",
    "assets/images/5.png",
    "assets/images/6.png",
    "assets/images/7.png",
    "assets/images/8.png",
    "assets/images/9.png",
    "assets/images/10.png",
    "assets/images/11.png",
    "assets/images/1.png",
    "assets/images/2.png",
    "assets/images/3.png",
    "assets/images/4.png",
    "assets/images/5.png",
    "assets/images/6.png",
    "assets/images/7.png",
    "assets/images/8.png",
    "assets/images/9.png",
    "assets/images/10.png",
    "assets/images/11.png",
  ];

  final List<String> dummySuggestions = [
    // N
    'Nature', 'Night Sky', 'National Parks', 'Natural Beauty',

    // C
    'Cars', 'Classic Cars', 'Car Modifications', 'Car Races',

    // F (Fitness)
    'Fitness', 'Functional Training', 'Fit Lifestyle', 'Full Body Workout',

    // F (Fashion)
    'Fashion', 'Formal Wear', 'Footwear', 'Fashion Trends',

    // S
    'Sunset', 'Sunrays', 'Summer Vibes', 'Silhouettes',

    // M
    'Mountains', 'Mountain Climbing', 'Misty Peaks', 'Mountain Trails',
  ];

  BuildContext? overlayContext;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Builder(builder: (BuildContext ctx) {
          overlayContext = ctx; // set context here
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SuggestionTextField(
                  suggestions: dummySuggestions,
                  labelText: "Search with Meta AI",
                  onSuggestionSelected: (value) {
                    print("Selected: $value");
                    // Optional: implement filter logic
                  },
                ),
              ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(2.0),
                  itemCount: images.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                  ),
                  itemBuilder: (context, index) {
                    return Image.asset(
                      images[index],
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
