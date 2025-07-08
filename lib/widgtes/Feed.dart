import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagramclone/Funtional_icons/likeButton.dart';
import 'package:instagramclone/Screens/HomePage.dart';
import 'package:instagramclone/widgtes/Expandable_Text.dart';

class Feed extends StatefulWidget {
  final List<Map<String, dynamic>> feedsss;

  const Feed({
    super.key,
    required this.feedsss,
  });

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.feedsss.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              height: 70,
              width: double.infinity,
              color: Colors.black,
              child: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF833AB4),
                          Color(0xFFFD1D1D),
                          Color(0xFFFCB045),
                        ],
                      ),
                    ),
                    child: Container(
                      height: 41,
                      width: 41,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(
                            feedAdmin[index]["profileImage"],
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 10)),
                      Text(
                        feedAdmin[index]['username'],
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 400,
              child: Image.asset(
                feedAdmin[index]["postImage"],
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 20)),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 10)),
                      LikeButton(),
                      Icon(
                        Icons.messenger_outline,
                        size: 22,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.send_outlined,
                        size: 22,
                      ),
                      Spacer(),
                      Icon(
                        Icons.bookmark_border_outlined,
                        size: 22,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 10)),
                      Text(
                        feedAdmin[index]["likes"],
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 5),
                    child: ExpandableText(
                      text: feedAdmin[index]['description'],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 10)),
                      Text(
                        feedAdmin[index]["comments"],
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff8A8A8A),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 10, top: 10)),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              feedAdmin[index]["commentprofile"],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Add a comment...",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff8A8A8A),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 10)),
                      Text(
                        feedAdmin[index]["timeAgo"],
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff8A8A8A),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
