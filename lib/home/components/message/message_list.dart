import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ibank/core/ui/design_system/ibank_app_bar.dart';
import 'package:ibank/home/components/message/model/message_tile.dart';

class MessageListAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MessageListAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;
    return IBankAppBar(
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: Text(
          'Message',
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
      backgroundColor: colorScheme.surface,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 16);
}

class MessageList extends StatelessWidget {
  const MessageList({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;
    final List<MessageTile> messages = [
      MessageTile(
        title: 'Bank of America',
        subtitle: 'Bank of America : 256486 is the au...',
        icon: 'assets/icons/bank.svg',
        iconBackgroundColor: colorScheme.primary,
        date: 'Today',
      ),
      const MessageTile(
        title: 'Account',
        subtitle: 'Your account is limited. Please foll...',
        icon: 'assets/icons/user.svg',
        iconBackgroundColor: Color(0xffff4267),
        date: 'Today',
      ),
      const MessageTile(
        title: 'Alert',
        subtitle: 'Your statement is ready for you to...',
        icon: 'assets/icons/phone_message.svg',
        iconBackgroundColor: Color(0xff0890fe),
        date: 'Today',
      ),
      const MessageTile(
        title: 'Paypal',
        subtitle: 'Your account has been locked. Ple...',
        icon: 'assets/icons/paypal.svg',
        iconBackgroundColor: Color(0xffffaf2a),
        date: 'Today',
      ),
      const MessageTile(
        title: 'Withdraw',
        subtitle: 'Dear customer, 2987456 is your co...',
        icon: 'assets/icons/credit_card_in.svg',
        iconBackgroundColor: Color(0xff52d5ba),
        date: 'Today',
      ),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListView.separated(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          var message = messages[index];
          return ListTile(
            onTap: () {},
            tileColor: colorScheme.surface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            leading: Container(
              decoration: BoxDecoration(
                color: message.iconBackgroundColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(
                  message.icon,
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
            ),
            title: Text(message.title, style: textTheme.titleLarge),
            subtitle: Text(
              message.subtitle,
              style: textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: colorScheme.outline.withAlpha(180),
              ),
            ),
            trailing: Text(
              message.date,
              style: textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w500,
                color: colorScheme.outline,
              ),
            ),
          );
        },
        separatorBuilder: (index, context) => const SizedBox(height: 8.0),
      ),
    );
  }
}
