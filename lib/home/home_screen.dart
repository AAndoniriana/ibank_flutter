import 'package:flutter/material.dart';
import 'package:ibank/core/ui/components/navbar/ibank_navigation_bar.dart';
import 'package:ibank/home/components/dashboard/dashboard.dart';
import 'package:ibank/home/components/message/message_list.dart';
import 'package:ibank/home/components/search/search.dart';
import 'package:ibank/home/models/home_screen_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    final List<HomeScreenModel> destinations = [
      HomeScreenModel(
        appBar: DashboardAppBar(),
        body: Dashboard(),
        backgroundColor: colorScheme.primary,
      ),
      HomeScreenModel(
        appBar: const SearchAppBar(),
        body: const Search(),
        backgroundColor: colorScheme.surfaceContainer,
      ),
      HomeScreenModel(
        appBar: const MessageListAppBar(),
        body: const MessageList(),
        backgroundColor: colorScheme.surfaceContainer,
      ),
    ];

    return Scaffold(
      backgroundColor: destinations[_currentIndex].backgroundColor,
      appBar: destinations[_currentIndex].appBar,
      body: destinations[_currentIndex].body,
      bottomNavigationBar: IBankNavigationBar(
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
