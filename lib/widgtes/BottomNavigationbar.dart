import 'package:flutter/material.dart';

class InstaBottomNav extends StatefulWidget {
  const InstaBottomNav({super.key});

  @override
  State<InstaBottomNav> createState() => _InstaBottomNavState();
}

class _InstaBottomNavState extends State<InstaBottomNav> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    //  HomePage(),
    //   Explore(),
    //  ReelsPage(),
    //   Center(
    //     child: Text(
    //       'Shop Screen',
    //       style: TextStyle(
    //         color: Colors.white,
    //       ),
    //     ),
    //   ),
    //   Center(
    //     child: Text(
    //       'Profile Screen',
    //       style: TextStyle(color: Colors.white),
    //     ),
    //   ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
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
