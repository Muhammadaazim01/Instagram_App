import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagramclone/Funtional_icons/ExpandedDescription.dart';
import 'package:instagramclone/Funtional_icons/FollowingButton.dart';
import 'package:instagramclone/Funtional_icons/likeButton.dart';
import 'package:video_player/video_player.dart';

class Reelwidgets extends StatefulWidget {
  final List<Map<String, dynamic>> videosreels;
  const Reelwidgets({super.key, required this.videosreels});

  @override
  State<Reelwidgets> createState() => _ReelwidgetsState();
}

class _ReelwidgetsState extends State<Reelwidgets> {
  VideoPlayerController? _controller;
  int _currentIndex = 0;
  bool _showPlayPauseIcon = false;
  IconData _playPauseIcon = Icons.pause;

  @override
  void initState() {
    super.initState();
    _initializeVideo(0);
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
                  LikeButton(),
                  SizedBox(height: 10),
                  Text(
                    widget.videosreels[index]["liketext"],
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  SizedBox(height: 20),
                  Icon(Icons.messenger_outline, color: Colors.white),
                  SizedBox(height: 10),
                  Text(
                    widget.videosreels[index]["commentlike"],
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  SizedBox(height: 20),
                  Icon(Icons.send, color: Colors.white),
                  SizedBox(height: 30),
                  Icon(Icons.more_horiz, color: Colors.white),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
