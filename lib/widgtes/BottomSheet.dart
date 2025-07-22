import 'package:flutter/material.dart';

class ProfileBottomSheet {
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildOption(context, "Settings", Icons.settings),
              _buildOption(context, "Your activity", Icons.access_time),
              _buildOption(context, "Archive", Icons.archive),
              _buildOption(context, "QR code", Icons.qr_code),
              _buildOption(context, "Saved", Icons.bookmark_border),
              _buildOption(context, "Close Friends", Icons.group),
              Divider(color: Colors.grey),
              _buildOption(context, "Logout", Icons.logout, color: Colors.red),
            ],
          ),
        );
      },
    );
  }

  static Widget _buildOption(BuildContext context, String title, IconData icon,
      {Color color = Colors.white}) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        title,
        style: TextStyle(color: color, fontSize: 16),
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}
