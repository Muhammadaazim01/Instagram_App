import 'package:flutter/material.dart';
import 'package:instagramclone/Funtional_icons/FollowingButton.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> notifications = [
      {
        "user": "john_doe",
        "image": "assets/images/4.png",
        "type": "liked your photo",
        "time": "2h",
        "postImage": "assets/images/4.png",
        "isFollow": false,
      },
      {
        "user": "flutter_dev",
        "image": "assets/images/4.png",
        "type": "started following you",
        "time": "5h",
        "isFollow": true,
      },
      {
        "user": "tech_girl",
        "image": "assets/images/4.png",
        "type": "commented: Nice shot!",
        "time": "1d",
        "postImage": "assets/images/4.png",
        "isFollow": false,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Notifications',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];

          return ListTile(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            leading: CircleAvatar(
              backgroundImage: AssetImage(notification["image"]),
              radius: 25,
            ),
            title: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: notification["user"],
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  TextSpan(
                    text: " ${notification["type"]}",
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            subtitle: Text(
              notification["time"],
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
            trailing: notification["isFollow"]
                ? FollowingButton()
                : notification.containsKey("postImage")
                    ? Image.asset(
                        notification["postImage"],
                        width: 45,
                        height: 45,
                        fit: BoxFit.cover,
                      )
                    : null,
          );
        },
      ),
    );
  }
}

// class FollowButton extends StatelessWidget {
//   const FollowButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return OutlinedButton(
//       style: OutlinedButton.styleFrom(
//         side: const BorderSide(color: Colors.white),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//       ),
//       onPressed: () {},
//       child: const Text(
//         "Follow",
//         style: TextStyle(color: Colors.white),
//       ),
//     );
//   }
// }
//
