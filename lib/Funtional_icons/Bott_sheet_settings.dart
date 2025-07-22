import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetSetting {
  static void showSettingSheet({
    required List<BottomSheetAction> icons,
    required List<BottomSheetTile> tiles,
  }) {
    Get.bottomSheet(
      Container(
        decoration: const BoxDecoration(
          color: Color(0xff1c1c1e),
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Wrap(
          children: [
            Center(
              child: Container(
                width: 40,
                height: 5,
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[700],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            if (icons.isNotEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: icons
                    .map((action) => _SheetIcon(
                          icon: action.icon,
                          label: action.label,
                          onTap: () {
                            Get.back();
                            action.onTap?.call();
                          },
                        ))
                    .toList(),
              ),
            if (icons.isNotEmpty) const Divider(color: Colors.grey),
            ...tiles.map((tile) => _SheetTile(
                  icon: tile.icon,
                  label: tile.label,
                  color: tile.color,
                  onTap: tile.onTap,
                )),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }
}

class BottomSheetAction {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  BottomSheetAction({
    required this.icon,
    required this.label,
    this.onTap,
  });
}

class BottomSheetTile {
  final IconData icon;
  final String label;
  final Color? color;
  final VoidCallback? onTap;

  BottomSheetTile({
    required this.icon,
    required this.label,
    this.color,
    this.onTap,
  });
}

class _SheetIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const _SheetIcon({required this.icon, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[850],
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}

class _SheetTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? color;
  final VoidCallback? onTap;

  const _SheetTile({
    required this.icon,
    required this.label,
    this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: color ?? Colors.white),
      title: Text(label, style: TextStyle(color: color ?? Colors.white)),
      onTap: () {
        Get.back();
        onTap?.call();
      },
    );
  }
}
