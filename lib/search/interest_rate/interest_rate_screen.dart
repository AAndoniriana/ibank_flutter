import 'package:flutter/material.dart';
import 'package:ibank/core/ui/components/basic_scaffold.dart';

import 'models/interest_rate_model.dart';

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
          child: DataTable(
            dividerThickness: 1,
            columnSpacing: 28,
            horizontalMargin: 0,

            columns: [
              DataColumn(label: Text('Interest kind', style: headingStyle)),
              DataColumn(
                label: Text('Deposit', style: headingStyle),
                numeric: true,
              ),
              DataColumn(
                label: Text('Rate', style: headingStyle),
                numeric: true,
              ),
            ],
            rows: interestRates.map((interestRate) {
              return DataRow(
                cells: [
                  DataCell(Text(interestRate.interestKind, style: bodyStyle)),
                  DataCell(Text(interestRate.deposit, style: bodyStyle)),
                  DataCell(
                    Text(
                      interestRate.rate,
                      style: bodyStyle?.copyWith(color: colorScheme.primary),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
