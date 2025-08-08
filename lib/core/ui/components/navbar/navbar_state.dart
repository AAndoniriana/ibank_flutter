part of 'navbar_cubit.dart';

class NavigationBarState {
  NavigationBarState._();

  factory NavigationBarState() {
    _instance ??= NavigationBarState._();
    return _instance!;
  }

  static NavigationBarState? _instance;

  final List<NavigationItemModel> menus = const [
    NavigationItemModel(
      selectedIcon: Icons.home_rounded,
      icon: Icons.home_outlined,
      label: 'Home',
    ),
    NavigationItemModel(
      selectedIcon: Icons.search,
      icon: Icons.search_outlined,
      label: 'Search',
    ),
    NavigationItemModel(
      selectedIcon: Icons.mail_rounded,
      icon: Icons.mail_outline_rounded,
      label: 'Message',
    ),
    NavigationItemModel(
      selectedIcon: Icons.settings_rounded,
      icon: Icons.settings_outlined,
      label: 'Settings',
    ),
  ];

  int selectedIndex = 0;
}

class NavigationItemModel {
  const NavigationItemModel({
    required this.icon,
    required this.selectedIcon,
    required this.label,
  });

  final IconData icon;
  final IconData selectedIcon;
  final String label;
}
