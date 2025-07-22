import 'package:flutter/material.dart';
import 'package:instagramclone/widgtes/profiles/post_grid.dart';
import 'package:instagramclone/widgtes/profiles/reel_grid.dart';

class ProfileTabs extends StatelessWidget {
  const ProfileTabs({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> posts = [
      "assets/images/4.png",
      "assets/images/4.png",
      "assets/images/4.png",
      "assets/images/4.png",
      "assets/images/4.png",
      "assets/images/4.png",
      "assets/images/4.png",
      "assets/images/4.png",
      "assets/images/4.png",
      "assets/images/4.png",
      "assets/images/4.png",
      "assets/images/4.png",
      "assets/images/4.png",
      "assets/images/4.png",
      "assets/images/4.png",
      "assets/images/4.png",
      "assets/images/4.png",
      "assets/images/4.png",
      "assets/images/4.png",
      "assets/images/4.png",
    ];
    List<String> grid = [
      "assets/images/4.png",
      "assets/images/4.png",
      "assets/images/4.png",
      "assets/images/4.png",
      "assets/images/4.png",
      "assets/images/4.png",
      "assets/images/4.png",
      "assets/images/4.png",
      "assets/images/4.png",
      "assets/images/4.png",
      "assets/images/4.png",
      "assets/images/4.png",
      "assets/images/4.png",
      "assets/images/4.png",
      "assets/images/4.png",
      "assets/images/4.png",
      "assets/images/4.png",
      "assets/images/4.png",
      "assets/images/4.png",
      "assets/images/4.png",
    ];

    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 1.5,
            tabs: [
              Tab(icon: Icon(Icons.grid_on_outlined)),
              Tab(icon: Icon(Icons.video_collection_outlined)),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: TabBarView(
              children: [
                PostGrid(postimages: posts),
                ReelGrid(gridimages: grid),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
