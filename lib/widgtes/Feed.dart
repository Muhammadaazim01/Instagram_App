import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagramclone/Funtional_icons/Bott_sheet_settings.dart';
import 'package:instagramclone/Funtional_icons/book_mark.dart';
import 'package:instagramclone/Funtional_icons/heart_Animation.dart';
import 'package:instagramclone/Screens/HomePage.dart';
import 'package:instagramclone/controllers/book_mark_controller.dart';
import 'package:instagramclone/widgtes/Expandable_Text.dart';
import 'package:instagramclone/widgtes/message_widgets/comments_bottom_sheet.dart';

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
  final BookmarkController controller = Get.find<BookmarkController>();

  List<List<String>> postcomment = [];
  late List<bool> isLikedList;
  List<bool> isSavedList = [];
  @override
  void initState() {
    super.initState();

    isLikedList = List.generate(widget.feedsss.length, (_) => false);
    postcomment = List.generate(widget.feedsss.length, (_) => []);
    controller.initializeList(widget.feedsss.length);
  }

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
                  IconButton(
                    onPressed: () {
                      BottomSheetSetting.showSettingSheet(
                        icons: [
                          BottomSheetAction(
                            icon: Icons.share,
                            label: 'Share',
                            onTap: () {
                              Get.snackbar(
                                "Share",
                                "Post shared successfully",
                                backgroundColor: Colors.grey[850],
                                snackPosition: SnackPosition.BOTTOM,
                              );
                            },
                          ),
                          BottomSheetAction(
                            icon: Icons.link,
                            label: 'Copy Link',
                            onTap: () {
                              Get.snackbar(
                                "Copied",
                                "Link copied to clipboard",
                                backgroundColor: Colors.grey[850],
                                snackPosition: SnackPosition.BOTTOM,
                              );
                            },
                          ),
                        ],
                        tiles: [
                          BottomSheetTile(
                            icon: Icons.notifications,
                            label: 'Turn of Feeds notification',
                            // color: Colors.red,
                            onTap: () {
                              Get.snackbar(
                                "Turn off",
                                "Feed notification",
                                backgroundColor: Colors.grey[850],
                                snackPosition: SnackPosition.BOTTOM,
                              );
                            },
                          ),
                          BottomSheetTile(
                            icon: Icons.not_interested_outlined,
                            label: "not interested",
                            onTap: () {
                              Get.snackbar(
                                "Not interested",
                                "Not interested in this Posted",
                                backgroundColor: Colors.grey[850],
                                snackPosition: SnackPosition.BOTTOM,
                              );
                            },
                          ),
                          BottomSheetTile(
                            icon: Icons.interests,
                            label: "interested",
                            onTap: () {
                              Get.snackbar(
                                "interested",
                                "Yes interested in this Posted",
                                backgroundColor: Colors.grey[850],
                                snackPosition: SnackPosition.BOTTOM,
                              );
                            },
                          ),
                        ],
                      );
                    },
                    icon: Icon(Icons.more_horiz, color: Colors.white),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 400,
              child: DoubleTapLikeWidget(
                onLiked: () {
                  setState(() {
                    isLikedList[index] = true;
                  });
                },
                child: Image.asset(
                  feedAdmin[index]["postImage"],
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
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
                      IconButton(
                        icon: Icon(
                          isLikedList[index]
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: isLikedList[index]
                              ? Colors.red.withOpacity(0.8)
                              : Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            isLikedList[index] = !isLikedList[index];
                          });
                        },
                      ),
                      IconButton(
                          icon: Icon(Icons.messenger_outline, size: 22),
                          onPressed: () async {
                            final newComment =
                                await showModalBottomSheet<String>(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (_) => CommentsBottomSheet(
                                comments: postcomment[index],
                              ),
                            );

                            if (newComment != null && newComment.isNotEmpty) {
                              setState(() {
                                postcomment[index].add(newComment);
                              });
                            }
                          }),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.send_outlined,
                        size: 22,
                      ),
                      Spacer(),
                      BookmarkButton(
                        screen: 'FeedScreen',
                        index: index,
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
                  if (postcomment[index].isNotEmpty)
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text(
                          postcomment[index].last,
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
                      CircleAvatar(
                        radius: 15,
                        backgroundImage:
                            AssetImage(feedAdmin[index]["commentprofile"]),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      TextButton(
                        onPressed: () async {
                          final newComment = await showModalBottomSheet<String>(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (_) => CommentsBottomSheet(
                              comments: postcomment[index],
                            ),
                          );

                          if (newComment != null && newComment.isNotEmpty) {
                            setState(() {
                              postcomment[index].add(newComment);
                            });
                          }
                        },
                        child: Text(
                          "Add a comment...",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff8A8A8A),
                          ),
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
