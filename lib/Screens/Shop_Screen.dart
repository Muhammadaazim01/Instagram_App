import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagramclone/widgtes/Tabbar.dart';

class Shop_Screen extends StatefulWidget {
  const Shop_Screen({super.key});

  @override
  State<Shop_Screen> createState() => _Shop_ScreenState();
}

class _Shop_ScreenState extends State<Shop_Screen> {
  final List<String> tabsshow = [
    "Editor’s picks",
    "New arrivals",
    "Trending",
    "Shoes",
    "Accessories",
    "Men",
    "Women",
    "Sale",
    "Brands",
    "Explore"
  ];

  final List<String> ShopList = [
    "assets/images/1.png",
    'assets/images/2.png',
    'assets/images/3.png',
    'assets/images/4.png',
    'assets/images/5.png',
    'assets/images/6.png',
    "assets/images/1.png",
    'assets/images/2.png',
    'assets/images/3.png',
    'assets/images/4.png',
    'assets/images/5.png',
    'assets/images/6.png',
    "assets/images/1.png",
    'assets/images/2.png',
    'assets/images/3.png',
    'assets/images/4.png',
    'assets/images/5.png',
    'assets/images/6.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: [
            Text(
              "Shop",
              style: GoogleFonts.roboto(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.collections_bookmark_outlined, size: 35),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.menu, size: 35),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              cursorColor: Color(0xff868686),
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                fillColor: Color(0xff262626),
                filled: true,
                prefixIcon: Icon(Icons.search, color: Color(0xff868686)),
                hintText: "Search with Meta AI",
                hintStyle: TextStyle(color: Color(0xff868686)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Color(0xff262626)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Color(0xff262626)),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TabbarShop(tabtext: tabsshow),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              itemCount: ShopList.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    ShopList[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
