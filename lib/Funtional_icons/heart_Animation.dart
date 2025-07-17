import 'package:flutter/material.dart';

class DoubleTapLikeWidget extends StatefulWidget {
  final Widget child; // image ya jo bhi show karna ho
  final VoidCallback? onLiked; // optional: parent ko inform kare

  const DoubleTapLikeWidget({
    super.key,
    required this.child,
    this.onLiked,
  });

  @override
  State<DoubleTapLikeWidget> createState() => _DoubleTapLikeWidgetState();
}

class _DoubleTapLikeWidgetState extends State<DoubleTapLikeWidget>
    with SingleTickerProviderStateMixin {
  bool isLiked = false;
  bool showHeart = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        setState(() {
          isLiked = true;
          showHeart = true;
        });

        // callback for like
        if (widget.onLiked != null) {
          widget.onLiked!();
        }

        // hide heart after short delay
        Future.delayed(const Duration(milliseconds: 700), () {
          if (mounted) {
            setState(() {
              showHeart = false;
            });
          }
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          widget.child,
          if (showHeart)
            AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: showHeart ? 1.0 : 0.0,
              child: const Icon(
                Icons.favorite,
                color: Colors.red,
                size: 100,
              ),
            ),
        ],
      ),
    );
  }
}
