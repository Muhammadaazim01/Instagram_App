import 'package:flutter/material.dart';
import 'package:instagramclone/chats/chat_profile.dart';

class MessageList extends StatelessWidget {
  final List<Map<String, dynamic>> messageslist;

  const MessageList({
    super.key,
    required this.messageslist,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: ListView.builder(
        itemCount: messageslist.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Chat_profile(
                            Imageuser: messageslist[index]["image"],
                            userprofiletitle: messageslist[index]["name"],
                            userSubtitle: messageslist[index]["time"],
                          )));
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundImage: AssetImage(messageslist[index]["image"]),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          messageslist[index]["name"],
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                        SizedBox(height: 4),
                        Text(
                          messageslist[index]["message"],
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.camera_alt_outlined, color: Colors.white),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
