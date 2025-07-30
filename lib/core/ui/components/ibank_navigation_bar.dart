import 'package:flutter/material.dart';

class IBankNavigationBar extends StatefulWidget {
  const IBankNavigationBar({super.key});

  @override
  State<IBankNavigationBar> createState() => _IBankNavigationBarState();
}

class _IBankNavigationBarState extends State<IBankNavigationBar> {
  final List<_NavigationItemModel> items = [
    _NavigationItemModel(
      selectedIcon: Icons.home_rounded,
      icon: Icons.home_outlined,
      label: 'Home',
    ),
    _NavigationItemModel(
      selectedIcon: Icons.search,
      icon: Icons.search_outlined,
      label: 'Search',
    ),
    _NavigationItemModel(
      selectedIcon: Icons.mail_rounded,
      icon: Icons.mail_outline_rounded,
      label: 'Mail',
    ),
    _NavigationItemModel(
      selectedIcon: Icons.settings_rounded,
      icon: Icons.settings_outlined,
      label: 'Settings',
    ),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      height: 120,
      color: colorScheme.surfaceContainerLowest,
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (int index = 0; index < items.length; index++)
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                child: _NavigationItem(
                  icon: Icon(
                    items[index].icon,
                    color: colorScheme.outline,
                    size: 40,
                  ),
                  selectedIcon: Icon(
                    items[index].selectedIcon,
                    color: Colors.white,
                    size: 40,
                  ),
                  label: items[index].label,
                  isSelected: index == _selectedIndex,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _NavigationItem extends StatelessWidget {
  const _NavigationItem({
    required this.icon,
    required this.selectedIcon,
    required this.label,
    required this.isSelected,
  });

  final Widget icon;
  final Widget selectedIcon;
  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;
    Widget content;
    if (isSelected) {
      content = Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.0),
          color: colorScheme.primary,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          child: Row(
            spacing: 8.0,
            children: [
              selectedIcon,
              Text(
                label,
                style: textTheme.titleMedium?.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      );
    } else {
      content = icon;
    }
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 150),
      transitionBuilder: (child, animation) {
        return ScaleTransition(scale: animation, child: child);
      },
      child: content,
    );
  }
}

class _NavigationItemModel {
  const _NavigationItemModel({
    required this.icon,
    required this.selectedIcon,
    required this.label,
  });

  final IconData icon;
  final IconData selectedIcon;
  final String label;
}
