import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class P_grid extends StatelessWidget {
  final List<Map<String, dynamic>> highlight;
  const P_grid({
    super.key,
    required this.highlight,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        itemCount: highlight.length + 1,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final isAddNew = index == highlight.length;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.grey,
                      width: 2,
                    ),
                  ),
                  child: Container(
                    height: 58,
                    width: 58,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                      image: isAddNew
                          ? null
                          : DecorationImage(
                              image: AssetImage(highlight[index]["image"]),
                              fit: BoxFit.cover,
                            ),
                    ),
                    child: isAddNew
                        ? Center(
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 30,
                            ),
                          )
                        : null,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  isAddNew ? "New" : highlight[index]["highlighttext"],
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
