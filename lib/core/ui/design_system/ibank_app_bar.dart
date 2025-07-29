import 'package:flutter/material.dart';

class IBankAppBar extends StatelessWidget implements PreferredSizeWidget {
  const IBankAppBar({
    super.key,
    this.leading,
    required this.content,
    this.backgroundColor,
    this.trailing,
  });

  final Widget? leading;
  final Widget content;
  final Color? backgroundColor;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: backgroundColor != null ? backgroundColor! : Colors.transparent,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 12.0),
          child: Row(
            children: [
              if (leading != null) leading!,
              content,
              const Spacer(),
              if (trailing != null) trailing!,
            ],
          ),
        ),
      ),
    );
  }

  factory IBankAppBar.withBackButton({
    Key? key,
    required Widget content,
    Color? backgroundColor,
    Color? iconColor,
    void Function()? onBackPressed,
    Widget? trailing,
  }) {
    return IBankAppBar(
      key: key,
      leading: onBackPressed == null
          ? null
          : IconButton(
              icon: Icon(Icons.arrow_back_ios, color: iconColor),
              onPressed: onBackPressed,
            ),
      content: content,
      backgroundColor: backgroundColor,
      trailing: trailing,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 16);
}
