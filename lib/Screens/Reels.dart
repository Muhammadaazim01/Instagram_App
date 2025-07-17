import 'package:flutter/material.dart';
import 'package:instagramclone/widgtes/reelbuilder.dart';

class ReelsPage extends StatefulWidget {
  const ReelsPage({
    super.key,
  });

  @override
  State<ReelsPage> createState() => _ReelsPageState();
}

class _ReelsPageState extends State<ReelsPage> {
  final List<Map<String, dynamic>> reelplay = [
    {
      "videourl": "assets/videos/pubg_edit.mp4",
      "startpage": "Reels",
      "profile": "assets/images/messi.png",
      "userprofile": "PubgEdits",
      "Expandabeltext":
          "Unbelievable climbing speed by a professional climber scaling a 100ft wall in record time. Amazing strength and agility shown!Unbelievable climbing speed by a professional climber scaling a 100ft wall in record time. Amazing strength and agility shown!",
      "BottomMusicText": "earthfervor . Original Audio",
      "liketext": "31.7 k",
      "commentlike": "10 k",
    },
    {
      "videourl": "assets/videos/tehzeeb_hafi.mp4",
      "startpage": "Reels",
      "profile": "assets/images/messi.png",
      "userprofile": "Hafi_Writes",
      "Expandabeltext":
          "Unbelievable climbing speed by a professional climber scaling a 100ft wall in record time. Amazing strength and agility shown!Unbelievable climbing speed by a professional climber scaling a 100ft wall in record time. Amazing strength and agility shown!",
      "BottomMusicText": "Tehzeeb_Hafi . Original Audio",
      "liketext": "31.7 k",
      "commentlike": "10 k",
    },
    {
      "videourl": "assets/videos/cbum_ice_bath.mp4",
      "startpage": "Reels",
      "profile": "assets/images/cbumprofile.jpeg",
      "userprofile": "Mr_Olympia",
      "Expandabeltext":
          "Unbelievable climbing speed by a professional climber scaling a 100ft wall in record time. Amazing strength and agility shown!Unbelievable climbing speed by a professional climber scaling a 100ft wall in record time. Amazing strength and agility shown!",
      "BottomMusicText": "body_Builders . Original Audio",
      "liketext": "31.7 k",
      "commentlike": "10 k",
    },
    {
      "videourl": "assets/videos/olympia_conference.mp4",
      "startpage": "Reels",
      "profile": "assets/images/cbumprofile.jpeg",
      "userprofile": "Conference",
      "Expandabeltext":
          "Unbelievable climbing speed by a professional climber scaling a 100ft wall in record time. Amazing strength and agility shown!Unbelievable climbing speed by a professional climber scaling a 100ft wall in record time. Amazing strength and agility shown!",
      "BottomMusicText": "body_Builders . Original Audio",
      "liketext": "31.7 k",
      "commentlike": "10 k",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Reelwidgets(
        videosreels: reelplay,
      ),
    );
  }
}
