import 'package:flutter/material.dart';

class IBankProfileCard extends StatelessWidget {
  const IBankProfileCard({
    super.key,
    required this.isSelected,
    required this.image,
    required this.text,
    this.onTap,
  });

  final bool isSelected;
  final ImageProvider image;
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var colorScheme = theme.colorScheme;
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 136.0,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          color: isSelected ? colorScheme.primary : Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              spacing: 8.0,
              children: <Widget>[
                ClipOval(
                  child: Image(
                    image: image,
                    fit: BoxFit.cover,
                    width: 80,
                    height: 80,
                  ),
                ),
                Text(
                  text,
                  maxLines: 2,
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
