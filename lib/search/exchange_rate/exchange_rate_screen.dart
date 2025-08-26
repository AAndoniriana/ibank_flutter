import 'package:flutter/material.dart';
import 'package:ibank/core/ui/components/basic_scaffold.dart';
import 'package:ibank/search/exchange_rate/models/exchange_rate_model.dart';

class ExchangeRateScreen extends StatelessWidget {
  const ExchangeRateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;
    final TextStyle? headingStyle = textTheme.titleMedium?.copyWith(
      color: colorScheme.outline,
      fontWeight: FontWeight.w600,
    );
    final TextStyle? bodyStyle = textTheme.bodyMedium?.copyWith(
      fontWeight: FontWeight.w500,
    );

    return BasicScaffold(
      title: 'Exchange rate',
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SizedBox(
            width: double.infinity,
            child: Table(
              columnWidths: {
                0: FlexColumnWidth(),
                1: IntrinsicColumnWidth(),
                2: IntrinsicColumnWidth(),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 8.0,
                      ),
                      child: Text('Country', style: headingStyle),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 8.0,
                      ),
                      child: Text('Buy', style: headingStyle),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 8.0,
                      ),
                      child: Text('Sale', style: headingStyle),
                    ),
                  ],
                ),
                for (var exchangeRate in exchangeRates)
                  TableRow(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1.0,
                          color: colorScheme.outline.withAlpha(72),
                        ),
                      ),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 16.0,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          spacing: 8.0,
                          children: [
                            Image(image: exchangeRate.flagImage),
                            Text(exchangeRate.name, style: bodyStyle),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 16.0,
                        ),
                        child: Text(
                          exchangeRate.buy,
                          textAlign: TextAlign.right,
                          style: bodyStyle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 16.0,
                        ),
                        child: Text(
                          exchangeRate.sell,
                          textAlign: TextAlign.right,
                          style: bodyStyle,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
