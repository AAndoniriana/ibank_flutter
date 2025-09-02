import 'package:flutter/material.dart';
import 'package:ibank/core/ui/components/basic_scaffold.dart';
import 'package:ibank/core/ui/design_system/ibank_button.dart';
import 'package:ibank/core/ui/design_system/ibank_input.dart';

class ExchangeScreen extends StatelessWidget {
  const ExchangeScreen({super.key});

  final List<String> _currencies = const [
    'USD',
    'EUR',
    'JPY',
    'GBP',
    'AUD',
    'CAD',
    'CHF',
    'CNY',
    'SEK',
    'NZD',
    'MXN',
    'SGD',
    'HKD',
    'NOK',
    'KRW',
    'TRY',
    'RUB',
    'INR',
    'BRL',
    'ZAR',
  ];

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;

    return BasicScaffold(
      title: 'Exchange',
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 12.0,
            children: [
              Image.asset('assets/images/exchange_image.png'),
              Card(
                color: colorScheme.surface,
                elevation: 0.5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
                shadowColor: colorScheme.shadow.withAlpha(124),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 16.0,
                  ),
                  child: Column(
                    spacing: 8.0,
                    children: [
                      _CurrencyInput(
                        currencies: _currencies,
                        onChanged: (value, currency) {},
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Image.asset('assets/images/arrow.png'),
                      ),
                      _CurrencyInput(
                        currencies: _currencies,
                        onChanged: (value, currency) {},
                      ),
                      Row(
                        children: [
                          Text(
                            'Currency rate',
                            style: textTheme.bodyMedium?.copyWith(
                              color: colorScheme.primary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          Text('1 USD = 112 KRW', style: textTheme.bodyMedium),
                        ],
                      ),
                      IBankButton(text: 'Exchange', onPressed: () {}),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CurrencyInput extends StatefulWidget {
  const _CurrencyInput({required this.currencies, this.onChanged});

  final List<String> currencies;
  final void Function(String value, String currency)? onChanged;

  @override
  State<_CurrencyInput> createState() => _CurrencyInputState();
}

class _CurrencyInputState extends State<_CurrencyInput> {
  late String _selectedItem = widget.currencies.first;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;
    return IBankInput(
      keyboardType: TextInputType.number,
      onChanged: (value) {
        widget.onChanged?.call(value, _selectedItem);
      },
      decoration: InputDecoration(
        hintText: 'Amount',
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 4.0,
          children: [
            Container(color: colorScheme.outline, height: 32.0, width: 1.0),
            PopupMenuButton(
              icon: Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 4.0,
                children: [
                  Text(_selectedItem, style: textTheme.bodyMedium),
                  Icon(Icons.unfold_more),
                ],
              ),
              onSelected: (item) {
                setState(() {
                  _selectedItem = item;
                });
              },
              itemBuilder: (context) {
                return widget.currencies
                    .map(
                      (currency) =>
                          PopupMenuItem(value: currency, child: Text(currency)),
                    )
                    .toList();
              },
            ),
          ],
        ),
      ),
    );
  }
}
