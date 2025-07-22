import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagramclone/Funtional_icons/Bott_sheet_settings.dart';
import 'package:instagramclone/Funtional_icons/ExpandedDescription.dart';
import 'package:instagramclone/Funtional_icons/FollowingButton.dart';
import 'package:instagramclone/controllers/book_mark_controller.dart';
import 'package:instagramclone/widgtes/message_widgets/comments_bottom_sheet.dart';
import 'package:video_player/video_player.dart';

class Reelwidgets extends StatefulWidget {
  final List<Map<String, dynamic>> videosreels;
  const Reelwidgets({super.key, required this.videosreels});

  @override
  State<Reelwidgets> createState() => _ReelwidgetsState();
}

class _ReelwidgetsState extends State<Reelwidgets> {
  List<List<String>> reelscomment = [];
  VideoPlayerController? _controller;
  int _currentIndex = 0;
  bool _showPlayPauseIcon = false;
  IconData _playPauseIcon = Icons.pause;
  bool _isLiked = false;
  bool _showHeart = false;
  final BookmarkController controller = Get.find<BookmarkController>();
  @override
  void initState() {
    super.initState();
    _initializeVideo(0);
    reelscomment = List.generate(widget.videosreels.length, (_) => []);
    controller.initializeList(widget.videosreels.length);
  }

  void _initializeVideo(int index) {
    if (_controller != null) {
      _controller!.pause();
      _controller!.dispose();
    }

    _controller =
        VideoPlayerController.asset(widget.videosreels[index]["videourl"]);
    _controller!.initialize().then((_) {
      if (mounted) {
        setState(() {
          _controller!.play();
          _controller!.setLooping(true);
          _isLiked = false;
          _showHeart = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: widget.videosreels.length,
      onPageChanged: (index) {
        setState(() {
          _currentIndex = index;
        });
        _initializeVideo(index);
      },
      itemBuilder: (context, index) {
        return Stack(
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onDoubleTap: () {
                setState(() {
                  _isLiked = true;
                  _showHeart = true;
                });
                Future.delayed(Duration(milliseconds: 700), () {
                  setState(() {
                    _showHeart = false;
                  });
                });
              },
              onTap: () {
                if (index == _currentIndex) {
                  setState(() {
                    if (_controller!.value.isPlaying) {
                      _controller!.pause();
                      _playPauseIcon = Icons.play_arrow;
                    } else {
                      _controller!.play();
                      _playPauseIcon = Icons.pause;
                    }
                    _showPlayPauseIcon = true;
                  });
                  Future.delayed(Duration(milliseconds: 500), () {
                    if (mounted) {
                      setState(() {
                        _showPlayPauseIcon = false;
                      });
                    }
                  });
                }
              },
              child: Container(
                color: Colors.black,
                child: _controller != null &&
                        _controller!.value.isInitialized &&
                        index == _currentIndex
                    ? SizedBox.expand(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            FittedBox(
                              fit: BoxFit.cover,
                              child: SizedBox(
                                width: _controller!.value.size.width,
                                height: _controller!.value.size.height,
                                child: VideoPlayer(_controller!),
                              ),
                            ),
                            if (_showHeart)
                              AnimatedOpacity(
                                opacity: _showHeart ? 1.0 : 0.0,
                                duration: Duration(milliseconds: 300),
                                child: Icon(
                                  Icons.favorite,
                                  size: 100,
                                  color: Colors.red.withOpacity(0.8),
                                ),
                              ),
                            AnimatedOpacity(
                              opacity: _showPlayPauseIcon ? 1.0 : 0.0,
                              duration: Duration(milliseconds: 200),
                              child: Icon(
                                _playPauseIcon,
                                size: 80,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      )
                    : Center(child: CircularProgressIndicator()),
              ),
            ),
            Positioned(
              top: 20,
              left: 15,
              right: 15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.videosreels[index]["startpage"],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.white,
                    size: 24,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              left: 15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          widget.videosreels[index]["profile"],
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        widget.videosreels[index]["userprofile"],
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(width: 10),
                      FollowingButton(),
                    ],
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: 320,
                    child: ExpandableDescription(
                      text: widget.videosreels[index]["Expandabeltext"],
                    ),
                  ),
                  SizedBox(height: 40),
                  Row(
                    children: [
                      Icon(Icons.music_note, color: Colors.white),
                      Text(
                        widget.videosreels[index]["BottomMusicText"],
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              right: 15,
              child: Column(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        _isLiked ? Icons.favorite : Icons.favorite_border,
                        color: _isLiked ? Colors.pink : Colors.white,
                      )),
                  SizedBox(height: 10),
                  Text(
                    widget.videosreels[index]["liketext"],
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  SizedBox(height: 20),
                  IconButton(
                    icon: Icon(Icons.messenger_outline, color: Colors.white),
                    onPressed: () async {
                      final newComment = await showModalBottomSheet<String>(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (_) => CommentsBottomSheet(
                              comments: reelscomment[index]));
                      if (newComment != null && newComment.isNotEmpty) {
                        setState(() {
                          reelscomment[index].add(newComment);
                        });
                      }
                    },
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.videosreels[index]["commentlike"],
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  SizedBox(height: 20),
                  Obx(() {
                    bool isSaved = controller.isSaved('ReelScreen', index);
                    return IconButton(
                      onPressed: () {
                        controller.toggleSave('ReelScreen', index);
                      },
                      icon: Icon(
                        isSaved
                            ? Icons.bookmark
                            : Icons.bookmark_border_outlined,
                        color: Colors.white,
                      ),
                    );
                  }),
                  SizedBox(height: 20),
                  Icon(Icons.send, color: Colors.white),
                  SizedBox(height: 30),
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
                                "Reel shared successfully",
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
                            label: 'Turn of Reels notification',
                            // color: Colors.red,
                            onTap: () {
                              Get.snackbar(
                                "Turn off",
                                "Reels notification",
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
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
