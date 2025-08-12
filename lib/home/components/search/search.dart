import 'package:flutter/material.dart';
import 'package:ibank/core/ui/design_system/ibank_app_bar.dart';
import 'package:ibank/search/branch/branch_screen.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;

    return IBankAppBar(
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: Text(
          'Search',
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
      backgroundColor: colorScheme.surface,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 16);
}

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          spacing: 10.0,
          children: [
            _SearchCard(
              title: 'Branch',
              description: 'Search for a branch',
              imagePath: 'assets/images/bank.png',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const BranchScreen()),
                );
              },
            ),
            _SearchCard(
              title: 'Interest rate',
              description: 'Search for interest rate',
              imagePath: 'assets/images/interest_rate.png',
              onTap: () {},
            ),
            _SearchCard(
              title: 'Exchange rate',
              description: 'Search for exchange rate',
              imagePath: 'assets/images/exchange_rate.png',
              onTap: () {},
            ),
            _SearchCard(
              title: 'Exchange',
              description: 'Exchange an amount of money',
              imagePath: 'assets/images/exchange.png',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchCard extends StatelessWidget {
  const _SearchCard({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.onTap,
  });

  final String title;
  final String description;
  final String imagePath;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: colorScheme.surface,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8.0,
                children: [
                  Text(
                    title,
                    style: textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    description,
                    style: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.outline,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Image.asset(imagePath, fit: BoxFit.cover),
            ],
          ),
        ),
      ),
    );
  }
}
