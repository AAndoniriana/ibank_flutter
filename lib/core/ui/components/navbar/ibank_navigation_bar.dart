import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibank/core/ui/components/navbar/navbar_cubit.dart';

class IBankNavigationBar extends StatelessWidget {
  const IBankNavigationBar({super.key, this.onDestinationSelected});

  final void Function(int)? onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return BlocBuilder<NavbarCubit, int>(
      builder: (context, state) {
        var menus = NavigationBarState().menus;
        return Container(
          width: double.infinity,
          height: 100,
          color: colorScheme.surfaceContainerLowest,
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (int index = 0; index < menus.length; index++)
                  GestureDetector(
                    onTap: () {
                      BlocProvider.of<NavbarCubit>(context).changeIndex(index);
                      onDestinationSelected?.call(index);
                    },
                    child: _NavigationItem(
                      icon: Icon(
                        menus[index].icon,
                        color: colorScheme.outline,
                        size: 40,
                      ),
                      selectedIcon: Icon(
                        menus[index].selectedIcon,
                        color: Colors.white,
                        size: 40,
                      ),
                      label: menus[index].label,
                      isSelected: index == state,
                    ),
                  ),
              ],
            ),
          ),
        );
      },
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
