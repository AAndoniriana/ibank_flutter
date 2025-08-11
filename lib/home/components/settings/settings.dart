import 'package:flutter/material.dart';
import 'package:ibank/core/ui/design_system/ibank_app_bar.dart';

class SettingsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SettingsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;
    return IBankAppBar(
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: Text(
          'Settings',
          style: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
            color: colorScheme.onPrimary,
          ),
        ),
      ),
      backgroundColor: colorScheme.primary,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 16);
}

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;
    List<String> menus = [
      'Password',
      'Touch ID',
      'Languages',
      'App Information',
      'Customer Care',
    ];
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 56.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Column(
            spacing: 12.0,
            children: [
              CircleAvatar(
                radius: 56.0,
                foregroundImage: Image.asset(
                  'assets/images/default_avatar.png',
                ).image,
              ),
              Text(
                'Push Puttichai',
                style: textTheme.headlineSmall?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {},
                        title: Text(menus[index], style: textTheme.labelLarge),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: colorScheme.outline.withAlpha(120),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: menus.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
