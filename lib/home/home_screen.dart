import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ibank/core/ui/components/ibank_navigation_bar.dart';
import 'package:ibank/core/ui/design_system/ibank_app_bar.dart';
import 'package:ibank/home/components/card_menu.dart';

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
          color: colorScheme.surfaceContainer,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8.0,
                  children: menus,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const IBankNavigationBar(),
    );
  }
}

final List<CardMenu> menus = [
  CardMenu(
    label: 'Account and Card',
    icon: SvgPicture.asset('assets/icons/wallet.svg'),
  ),
  CardMenu(
    label: 'Transfer',
    icon: SvgPicture.asset('assets/icons/sync_devices.svg'),
  ),
  CardMenu(
    label: 'Withdraw',
    icon: SvgPicture.asset('assets/icons/credit_card_in.svg'),
  ),
  CardMenu(
    label: 'Mobile prepaid',
    icon: SvgPicture.asset('assets/icons/mobile_banking.svg'),
  ),
  CardMenu(
    label: 'Pay the bill',
    icon: SvgPicture.asset('assets/icons/receipt_list.svg'),
  ),
  CardMenu(
    label: 'Save online',
    icon: SvgPicture.asset('assets/icons/pig.svg'),
  ),
  CardMenu(
    label: 'Credit card',
    icon: SvgPicture.asset(
      'assets/icons/credit-card.svg',
      colorFilter: ColorFilter.mode(const Color(0xFFFB6B18), BlendMode.srcIn),
    ),
  ),
  CardMenu(
    label: 'Transaction report',
    icon: SvgPicture.asset('assets/icons/file_paragraph.svg'),
  ),
  CardMenu(
    label: 'Beneficiary',
    icon: SvgPicture.asset('assets/icons/contacts.svg'),
  ),
];
