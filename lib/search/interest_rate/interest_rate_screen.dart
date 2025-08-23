import 'package:flutter/material.dart';
import 'package:ibank/core/ui/components/basic_scaffold.dart';
import 'package:ibank/search/interest_rate/models/interest_rate_model.dart';

class InterestRateScreen extends StatelessWidget {
  const InterestRateScreen({super.key});

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
      title: 'Interest Rate',
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
                      child: Text('Interest kind', style: headingStyle),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 8.0,
                      ),
                      child: Text('Deposit', style: headingStyle),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 8.0,
                      ),
                      child: Text('Rate', style: headingStyle),
                    ),
                  ],
                ),
                for (var interestRate in interestRates)
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
                        child: Text(
                          interestRate.interestKind,
                          style: bodyStyle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 16.0,
                        ),
                        child: Text(
                          interestRate.deposit,
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
                          interestRate.rate,
                          textAlign: TextAlign.right,
                          style: bodyStyle?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: colorScheme.primary,
                          ),
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
