import 'package:flutter/material.dart';

class Chat_main extends StatefulWidget {
  const Chat_main({super.key});

  @override
  State<Chat_main> createState() => _Chat_mainState();
}

class _Chat_mainState extends State<Chat_main> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage("assets/images/1.png"),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.4,
                  ),
                  child: Text(
                    "RA_SHOPPING_HUB",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  "ra_shopping_hub",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.call_outlined,
              size: 28,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.video_call_outlined,
              size: 28,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
