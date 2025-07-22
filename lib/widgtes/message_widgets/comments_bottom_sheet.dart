import 'package:flutter/material.dart';

class CommentsBottomSheet extends StatefulWidget {
  final List<String> comments;

  const CommentsBottomSheet({super.key, required this.comments});

  @override
  State<CommentsBottomSheet> createState() => _CommentsBottomSheetState();
}

class _CommentsBottomSheetState extends State<CommentsBottomSheet> {
  @override
  Widget build(BuildContext context) {
    TextEditingController commentController = TextEditingController();

    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.7,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Color(0xff262626),
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            const SizedBox(height: 8),
            Container(
              width: 40,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Comments',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: widget.comments.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/messi.png'),
                    ),
                    title: Text(widget.comments[index]),
                    subtitle: const Text("1s ago"),
                  );
                },
              ),
            ),
            const Divider(),
            Row(
              children: [
                const CircleAvatar(
                  radius: 18,
                  backgroundImage: AssetImage('assets/images/messi.png'),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: commentController,
                    cursorColor: Color(0xff868686),
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      fillColor: Color(0xff262626),
                      filled: true,
                      prefixIcon: Icon(Icons.search, color: Color(0xff868686)),
                      hintText: "Add a comment...",
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
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    final text = commentController.text;
                    if (text.isNotEmpty) {
                      setState(() {
                        widget.comments.add(text);
                        commentController.clear();
                      });
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
