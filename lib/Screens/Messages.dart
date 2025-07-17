import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagramclone/widgtes/message_widgets/Messages_list.dart';
import 'package:instagramclone/widgtes/message_widgets/message_grid.dart';
import 'package:instagramclone/widgtes/message_widgets/message_request.dart';

class Message_Screen extends StatefulWidget {
  const Message_Screen({super.key});

  @override
  State<Message_Screen> createState() => _Message_ScreenState();
}

class _Message_ScreenState extends State<Message_Screen> {
  final List<Map<String, dynamic>> Onlineadmin = [
    {
      "name": "Your note",
      "image": "assets/images/1.png",
      "isOnline": true,
    },
    {
      "name": "Rizwan",
      "image": "assets/images/2.png",
      "isOnline": true,
    },
    {
      "name": "Ali",
      "image": "assets/images/3.png",
      "isOnline": false,
    },
    {
      "name": "Sana",
      "image": "assets/images/4.png",
      "isOnline": false,
    },
    {
      "name": "Hina",
      "image": "assets/images/5.png",
      "isOnline": false,
    },
    {
      "name": "Your note",
      "image": "assets/images/1.png",
      "isOnline": false,
    },
    {
      "name": "Rizwan",
      "image": "assets/images/2.png",
      "isOnline": false,
    },
    {
      "name": "Ali",
      "image": "assets/images/3.png",
      "isOnline": false,
    },
    {
      "name": "Sana",
      "image": "assets/images/4.png",
      "isOnline": false,
    },
    {
      "name": "Hina",
      "image": "assets/images/5.png",
      "isOnline": false,
    },
  ];
  final List<Map<String, dynamic>> messagesmain = [
    {
      "name": "Ali",
      "image": "assets/images/1.png",
      "message": "Hey, what's up?",
      "time": "2h ago",
    },
    {
      "name": "Sana",
      "image": "assets/images/2.png",
      "message": "Let’s catch up later.",
      "time": "1d ago",
    },
    {
      "name": "MUZAFFAR",
      "image": "assets/images/1.png",
      "message": "Let’s catch up later.",
      "time": "1d ago",
    },
    {
      "name": "Sariq",
      "image": "assets/images/4.png",
      "message": "Let’s catch up later.",
      "time": "1d ago",
    },
    {
      "name": "Sariq",
      "image": "assets/images/8.png",
      "message": "Let’s catch up later.",
      "time": "1d ago",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: Container(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.4),
          child: Text(
            "Messages",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              Icons.edit_document,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: ListView(
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
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 100,
            child: Message_grid(
              onlineUser: Onlineadmin,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Messages",
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MessageRequest(),
                      ),
                    );
                  },
                  child: Text(
                    "Requests",
                    style: GoogleFonts.roboto(
                      color: Colors.blue,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          MessageList(
            messageslist: messagesmain,
          )
        ],
      ),
    );
  }
}
