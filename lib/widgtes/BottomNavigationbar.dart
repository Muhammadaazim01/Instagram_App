import 'package:flutter/material.dart';
import 'package:instagramclone/Screens/Explore.dart';
import 'package:instagramclone/Screens/HomePage.dart';
import 'package:instagramclone/Screens/Reels.dart';
import 'package:instagramclone/Screens/Shop_Screen.dart';
import 'package:instagramclone/Screens/UserProfile.dart';

class InstaBottomNav extends StatefulWidget {
  const InstaBottomNav({super.key});

  @override
  State<InstaBottomNav> createState() => _InstaBottomNavState();
}

class _InstaBottomNavState extends State<InstaBottomNav> {
  int selectedIndex = 0;

  final List<Widget> screens = [
    HomePage(),
    Explore(),
    ReelsPage(),
    Shop_Screen(),
    Profile_Screen(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[600],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_creation_outlined),
            label: "Reels",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: "Shop",
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 12,
              backgroundImage: AssetImage("assets/images/messi.png"),
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
