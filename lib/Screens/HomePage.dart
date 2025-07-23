import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagramclone/Screens/Messages.dart';
import 'package:instagramclone/Screens/notification_screen.dart';
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
    'username': 'Lura',
  },
  {
    'userstoryimage': 'assets/images/1.png',
    'username': 'brain',
  },
  {
    'userstoryimage': 'assets/images/brain.png',
    'username': 'mark',
  },
  {
    'userstoryimage': 'assets/images/2.png',
    'username': 'williomson',
  },
  {
    'userstoryimage': 'assets/images/4.png',
    'username': 'tate',
  },
  {
    'userstoryimage': 'assets/images/5.png',
    'username': 'christian',
  },
  {
    'userstoryimage': 'assets/images/6.png',
    'username': 'shelby',
  },
  {
    'userstoryimage': 'assets/images/7.png',
    'username': 'thomas',
  },
  {
    'userstoryimage': 'assets/images/8.png',
    'username': 'andy',
  },
  {
    'userstoryimage': 'assets/images/9.png',
    'username': 'max',
  },
  {
    'userstoryimage': 'assets/images/10.png',
    'username': 'zendy',
  },
  {
    'userstoryimage': 'assets/images/11.png',
    'username': 'william',
  },
  {
    'userstoryimage': 'assets/images/brain.png',
    'username': 'brain',
  },
];
final List<Map<String, dynamic>> feedAdmin = [
  {
    'profileImage': 'assets/images/cbumprofile.jpeg',
    'username': 'Cbum',
    'postImage': 'assets/images/cbumprofile.jpeg',
    'likes': '105,762 likes',
    'description':
        'marvel We can’t get enough of this dynamic duo. Marvel Studios’ @HawkeyeOfficial is now streaming on Disney. Catch all the action and adventure exclusively on the platform!',
    'comments': 'View all 103 comments',
    'commentprofile': 'assets/images/messi.png',
    'timeAgo': '13 hours ago',
  },
  {
    'profileImage': 'assets/images/andrew_tate.jpg',
    'username': 'Andrew_Tate',
    'postImage': 'assets/images/andrew_tate.jpg',
    'likes': '105,762 likes',
    'description':
        'I love you 3000 🫶@HawkeyeOfficial is now streaming on Disney. Catch all the action and adventure exclusively on the platform',
    'comments': 'View all 103 comments',
    'commentprofile': 'assets/images/messi.png',
    'timeAgo': '1 day ago',
  },
  {
    'profileImage': 'assets/images/goldberg.jpg',
    'username': 'Gold_Berg',
    'postImage': 'assets/images/goldberg.jpg',
    'likes': '105,762 likes',
    'description':
        'Chaos magic 💫 #scarletwitch I love you 3000 🫶@HawkeyeOfficial is now streaming on',
    'comments': 'View all 103 comments',
    'commentprofile': 'assets/images/messi.png',
    'timeAgo': '20 days ago',
  },
  {
    'profileImage': 'assets/images/reel1image.jpg',
    'username': 'Nature',
    'postImage': 'assets/images/reel1image.jpg',
    'likes': '105,762 likes',
    'description':
        'marvel We can’t get enough of this dynamic duo. Marvel Studios’ @HawkeyeOfficial is now streaming on Disney. Catch all the action and adventure exclusively on the platform!',
    'comments': 'View all 103 comments',
    'commentprofile': 'assets/images/messi.png',
    'timeAgo': '13 hours ago',
  },
  {
    'profileImage': 'assets/images/5.png',
    'username': 'bilal',
    'postImage': 'assets/images/Wallpaper2.jpeg',
    'likes': '105,762 likes',
    'description':
        'I love you 3000 🫶@HawkeyeOfficial is now streaming on Disney. Catch all the action and adventure exclusively on the platform',
    'comments': 'View all 103 comments',
    'commentprofile': 'assets/images/messi.png',
    'timeAgo': '1 day ago',
  },
  {
    'profileImage': 'assets/images/7.png',
    'username': 'Cbum_Official',
    'postImage': 'assets/images/cbumprofile.jpeg',
    'likes': '105,762 likes',
    'description':
        'Chaos magic 💫 #scarletwitch I love you 3000 🫶@HawkeyeOfficial is now streaming on',
    'comments': 'View all 103 comments',
    'commentprofile': 'assets/images/messi.png',
    'timeAgo': '20 days ago',
  },
];
bool hasNewNotification = true;

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
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(
                  Icons.favorite_border,
                  size: 25,
                ),
                onPressed: () {
                  setState(() {
                    hasNewNotification = false;
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotificationScreen()));
                },
              ),
              if (hasNewNotification)
                Positioned(
                    right: 8,
                    top: 8,
                    child: Container(
                      width: 9,
                      height: 9,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ))
            ],
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
