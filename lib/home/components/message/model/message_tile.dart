import 'dart:ui';

class MessageTile {
  const MessageTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconBackgroundColor,
    required this.date,
  });

  final String title;
  final String subtitle;
  final String icon;
  final Color iconBackgroundColor;
  final String date;
}
