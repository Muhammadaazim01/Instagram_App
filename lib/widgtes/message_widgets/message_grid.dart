import 'package:flutter/material.dart';

class Message_grid extends StatelessWidget {
  final List<Map<String, dynamic>> onlineUser;
  const Message_grid({
    super.key,
    required this.onlineUser,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 10),
      itemCount: onlineUser.length,
      separatorBuilder: (context, index) => SizedBox(width: 12),
      itemBuilder: (context, index) {
        return Column(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage(onlineUser[index]["image"]),
                ),
                if (onlineUser[index]["isOnline"] == true)
                  Positioned(
                    right: 4,
                    bottom: 4,
                    child: Container(
                      height: 14,
                      width: 14,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 5),
            SizedBox(
              width: 60,
              child: Text(
                onlineUser[index]["name"],
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            )
          ],
        );
      },
    );
  }
}
