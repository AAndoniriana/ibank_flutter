import 'package:flutter/material.dart';
import 'package:ibank/core/ui/components/ibank_navigation_bar.dart';
import 'package:ibank/core/ui/design_system/ibank_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: colorScheme.primary,
      appBar: IBankAppBar(
        content: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
          child: Text(
            'Hi, Push Puttichai',
            style: textTheme.titleLarge?.copyWith(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        leading: CircleAvatar(
          foregroundImage: Image.asset(
            'assets/images/default_avatar.png',
          ).image,
          radius: 44,
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.notifications, color: Colors.white, size: 28),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHigh,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28),
          ),
        ),
      ),
      bottomNavigationBar: const IBankNavigationBar(),
    );
  }
}
