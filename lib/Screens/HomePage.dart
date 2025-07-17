import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagramclone/Screens/Messages.dart';
import 'package:instagramclone/widgtes/Feed.dart';
import 'package:instagramclone/widgtes/Storys.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final List<Map<String, String>> storyList = [
  {
    'userstoryimage': 'assets/images/messi.png',
    'username': 'john_doe',
  },
  {
    'userstoryimage': 'assets/images/1.png',
    'username': 'messi',
  },
  {
    'userstoryimage': 'assets/images/brain.png',
    'username': 'brain',
  },
  {
    'userstoryimage': 'assets/images/2.png',
    'username': 'messi',
  },
  {
    'userstoryimage': 'assets/images/4.png',
    'username': 'brain',
  },
  {
    'userstoryimage': 'assets/images/5.png',
    'username': 'messi',
  },
  {
    'userstoryimage': 'assets/images/6.png',
    'username': 'brain',
  },
  {
    'userstoryimage': 'assets/images/7.png',
    'username': 'brain',
  },
  {
    'userstoryimage': 'assets/images/8.png',
    'username': 'messi',
  },
  {
    'userstoryimage': 'assets/images/9.png',
    'username': 'brain',
  },
  {
    'userstoryimage': 'assets/images/10.png',
    'username': 'brain',
  },
  {
    'userstoryimage': 'assets/images/11.png',
    'username': 'messi',
  },
  {
    'userstoryimage': 'assets/images/brain.png',
    'username': 'brain',
  },
];
final List<Map<String, dynamic>> feedAdmin = [
  {
    'profileImage': 'assets/images/1.png',
    'username': 'marvel',
    'postImage': 'assets/images/Rectangle 1.png',
    'likes': '105,762 likes',
    'description':
        'marvel We can’t get enough of this dynamic duo. Marvel Studios’ @HawkeyeOfficial is now streaming on Disney. Catch all the action and adventure exclusively on the platform!',
    'comments': 'View all 103 comments',
    'commentprofile': 'assets/images/brain.png',
    'timeAgo': '13 hours ago',
  },
  {
    'profileImage': 'assets/images/2.png',
    'username': 'marvel',
    'postImage': 'assets/images/Wallpaper2.jpeg',
    'likes': '105,762 likes',
    'description':
        'I love you 3000 🫶@HawkeyeOfficial is now streaming on Disney. Catch all the action and adventure exclusively on the platform',
    'comments': 'View all 103 comments',
    'commentprofile': 'assets/images/brain.png',
    'timeAgo': '1 day ago',
  },
  {
    'profileImage': 'assets/images/3.png',
    'username': 'marvel',
    'postImage': 'assets/images/Wallpaper2.jpeg',
    'likes': '105,762 likes',
    'description':
        'Chaos magic 💫 #scarletwitch I love you 3000 🫶@HawkeyeOfficial is now streaming on',
    'comments': 'View all 103 comments',
    'commentprofile': 'assets/images/brain.png',
    'timeAgo': '20 days ago',
  },
  {
    'profileImage': 'assets/images/4.png',
    'username': 'marvel',
    'postImage': 'assets/images/Rectangle 1.png',
    'likes': '105,762 likes',
    'description':
        'marvel We can’t get enough of this dynamic duo. Marvel Studios’ @HawkeyeOfficial is now streaming on Disney. Catch all the action and adventure exclusively on the platform!',
    'comments': 'View all 103 comments',
    'commentprofile': 'assets/images/brain.png',
    'timeAgo': '13 hours ago',
  },
  {
    'profileImage': 'assets/images/7.png',
    'username': 'marvel',
    'postImage': 'assets/images/Wallpaper2.jpeg',
    'likes': '105,762 likes',
    'description':
        'I love you 3000 🫶@HawkeyeOfficial is now streaming on Disney. Catch all the action and adventure exclusively on the platform',
    'comments': 'View all 103 comments',
    'commentprofile': 'assets/images/brain.png',
    'timeAgo': '1 day ago',
  },
  {
    'profileImage': 'assets/images/7.png',
    'username': 'marvel',
    'postImage': 'assets/images/Wallpaper2.jpeg',
    'likes': '105,762 likes',
    'description':
        'Chaos magic 💫 #scarletwitch I love you 3000 🫶@HawkeyeOfficial is now streaming on',
    'comments': 'View all 103 comments',
    'commentprofile': 'assets/images/brain.png',
    'timeAgo': '20 days ago',
  },
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: [
            Text(
              "Instagram",
              style: GoogleFonts.grandHotel(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.favorite_border,
              size: 37,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(CupertinoIcons.paperplane),
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      Message_Screen(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(1.0, 0.0);
                    const end = Offset.zero;
                    const curve = Curves.ease;

                    final tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));

                    return SlideTransition(
                      position: animation.drive(tween),
                      child: child,
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 115,
              child: List_Storys(
                stories: storyList,
              ),
            ),
            Feed(feedsss: feedAdmin)
          ],
        ),
      ),
    );
  }
}
