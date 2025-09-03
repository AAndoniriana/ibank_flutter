import 'package:flutter/material.dart';
import 'package:ibank/core/ui/components/basic_scaffold.dart';
import 'package:ibank/core/ui/design_system/ibank_button.dart';
import 'package:ibank/core/ui/design_system/ibank_input.dart';
import 'package:ibank/search/exchange/models/currency.dart';

class ExchangeScreen extends StatelessWidget {
  const ExchangeScreen({super.key});

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
                        currencies: currencies,
                        onChanged: (value, currency) {},
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Image.asset('assets/images/arrow.png'),
                      ),
                      _CurrencyInput(
                        currencies: currencies,
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

  final List<Currency> currencies;
  final void Function(String value, Currency currency)? onChanged;

  @override
  State<_CurrencyInput> createState() => _CurrencyInputState();
}

class _CurrencyInputState extends State<_CurrencyInput> {
  late Currency _selectedItem = widget.currencies.first;
  int _selectedIndex = 0;

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
        suffixIcon: GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => _CurrencyPicker(
                selectedIndex: _selectedIndex,
                currencies: widget.currencies,
                onSelected: (selectedIndex) {
                  setState(() {
                    _selectedIndex = selectedIndex;
                    _selectedItem = widget.currencies[selectedIndex];
                  });
                },
              ),
            );
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 4.0,
            children: [
              Container(color: colorScheme.outline, height: 32.0, width: 1.0),
              Text(_selectedItem.code, style: textTheme.bodyMedium),
              Icon(Icons.unfold_more, color: colorScheme.outline),
            ],
          ),
        ),
      ),
    );
  }
}

class _CurrencyPicker extends StatefulWidget {
  const _CurrencyPicker({
    required this.currencies,
    required this.onSelected,
    this.selectedIndex = 0,
  });

  final List<Currency> currencies;
  final void Function(int) onSelected;
  final int selectedIndex;

  @override
  State<_CurrencyPicker> createState() => _CurrencyPickerState();
}

class _CurrencyPickerState extends State<_CurrencyPicker> {
  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;

    return Dialog(
      backgroundColor: colorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.close, color: colorScheme.outline),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                spacing: 24.0,
                children: [
                  Text(
                    'Select currency',
                    style: textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemCount: widget.currencies.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 12.0),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            widget.onSelected(index);
                            Navigator.pop(context);
                          },
                          child: Row(
                            spacing: 8.0,
                            children: [
                              Text(
                                widget.currencies[index].code,
                                style: textTheme.bodyLarge?.copyWith(
                                  color: index == widget.selectedIndex
                                      ? colorScheme.primary
                                      : colorScheme.outline,
                                ),
                              ),
                              Text(
                                '(${widget.currencies[index].label})',
                                style: textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: index == widget.selectedIndex
                                      ? colorScheme.primary
                                      : colorScheme.outline,
                                ),
                              ),
                              const Spacer(),
                              if (index == widget.selectedIndex)
                                Icon(Icons.check, color: colorScheme.primary),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
