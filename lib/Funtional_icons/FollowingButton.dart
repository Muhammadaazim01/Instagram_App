import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FollowingButton extends StatefulWidget {
  const FollowingButton({super.key});

  @override
  State<FollowingButton> createState() => _FollowingButtonState();
}

class _FollowingButtonState extends State<FollowingButton> {
  bool isFollowing = false;

  void toggleFollow() {
    setState(() {
      isFollowing = !isFollowing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleFollow,
      child: Container(
        height: 25,
        width: 80,
        decoration: BoxDecoration(
          color: isFollowing ? Colors.transparent : Colors.transparent,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.white),
        ),
        child: Center(
          child: Text(
            isFollowing ? "Following" : "Follow",
            style: GoogleFonts.roboto(
              fontSize: 13,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
