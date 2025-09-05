import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ibank/core/ui/components/basic_scaffold.dart';
import 'package:ibank/core/ui/design_system/ibank_icon_card.dart';
import 'package:ibank/core/ui/design_system/ibank_input.dart';
import 'package:ibank/transaction/transfer/models/transaction_type_model.dart';

class TransferScreen extends StatelessWidget {
  const TransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicScaffold(
      title: 'Transfer',
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
          child: Column(
            spacing: 24.0,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _AutoCompleteSearchBar(items: items, onSelected: (value) {}),
              _TransactionType(
                transactionTypes: transactionTypes,
                onSelected: (transactionType) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TransactionType extends StatefulWidget {
  const _TransactionType({
    required this.transactionTypes,
    required this.onSelected,
  });

  final List<TransactionTypeModel> transactionTypes;
  final void Function(TransactionTypeModel) onSelected;

  @override
  State<_TransactionType> createState() => _TransactionTypeState();
}

class _TransactionTypeState extends State<_TransactionType> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: 8.0,
      children: [
        Text(
          "Choose transaction",
          style: textTheme.labelLarge?.copyWith(
            color: colorScheme.outline,
            fontWeight: FontWeight.w600,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: 8.0,
            children: [
              for (final (index, transactionType)
                  in widget.transactionTypes.indexed)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  child: IBankIconCard(
                    isEnabled: index == _selectedIndex,
                    icon: SvgPicture.asset(transactionType.iconPath),
                    text: transactionType.title,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _AutoCompleteSearchBar extends StatefulWidget {
  const _AutoCompleteSearchBar({required this.items, required this.onSelected});

  final List<String> items;
  final void Function(String) onSelected;

  @override
  State<_AutoCompleteSearchBar> createState() => _AutoCompleteSearchBarState();
}

class _AutoCompleteSearchBarState extends State<_AutoCompleteSearchBar> {
  bool _showBalance = false;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var colorScheme = Theme.of(context).colorScheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8.0,
      children: [
        Autocomplete<String>(
          initialValue: TextEditingValue(),
          onSelected: (value) {
            setState(() {
              _showBalance = true;
            });
            widget.onSelected(value);
          },
          optionsBuilder: (TextEditingValue textEditingValue) {
            return widget.items.where(
              (entry) => entry.contains(textEditingValue.text),
            );
          },
          fieldViewBuilder:
              (context, textEditingController, focusNode, onFieldSubmitted) {
                return IBankInput(
                  controller: textEditingController,
                  focusNode: focusNode,
                  onChanged: (value) {
                    if (value.isEmpty) {
                      setState(() {
                        _showBalance = false;
                      });
                    }
                  },
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.unfold_more),
                    hintText: 'Choose account / card',
                    hintStyle: textTheme.labelLarge?.copyWith(
                      color: colorScheme.outline,
                    ),
                  ),
                );
              },
        ),
        if (_showBalance)
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              "Available balance: \$1000.00",
              style: textTheme.labelLarge?.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
      ],
    );
  }
}

final List<String> items = List.generate(10, (index) {
  String cardNumber = '4';
  for (int i = 0; i < 15; i++) {
    cardNumber += (i % 4 == 3 && i < 14) ? ' ' : (index % 10).toString();
  }
  return cardNumber;
});
