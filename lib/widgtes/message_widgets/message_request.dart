import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MessageRequest extends StatefulWidget {
  const MessageRequest({super.key});

  @override
  State<MessageRequest> createState() => _MessageRequestState();
}

class _MessageRequestState extends State<MessageRequest> {
  final List<Map<String, String>> requests = [
    {
      "name": "John Doe",
      "username": "@johndoe",
      "profileImage": "assets/images/reel1image.jpg",
      "message": "Hey! I saw your post...",
    },
    {
      "name": "Sara Khan",
      "username": "@sarak",
      "profileImage": "assets/images/3.png",
      "message": "Can we collab on something?",
    },
    {
      "name": "Ali Raza",
      "username": "@ali.raza",
      "profileImage": "assets/images/9.png",
      "message": "Hello 👋",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: const Text(
          "Message Requests",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: ListView.builder(
        itemCount: requests.length,
        itemBuilder: (context, index) {
          final request = requests[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: [
                // Profile Image
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(request["profileImage"]!),
                ),
                const SizedBox(width: 12),
                // Name and message
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        request["name"]!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        request["message"]!,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                // Accept / Decline
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.check, color: Colors.blue),
                      onPressed: () {
                        // Accept logic
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.grey),
                      onPressed: () {
                        // Decline logic
                      },
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
