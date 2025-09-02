class Currency {
  const Currency({required this.code, required this.label});

  final String code;
  final String label;
}

final List<Currency> currencies = const [
  Currency(code: 'USD', label: 'United States Dollar'),
  Currency(code: 'EUR', label: 'Euro'),
  Currency(code: 'JPY', label: 'Japanese Yen'),
  Currency(code: 'GBP', label: 'British Pound Sterling'),
  Currency(code: 'AUD', label: 'Australian Dollar'),
  Currency(code: 'CAD', label: 'Canadian Dollar'),
  Currency(code: 'CHF', label: 'Swiss Franc'),
  Currency(code: 'CNY', label: 'Chinese Yuan'),
  Currency(code: 'SEK', label: 'Swedish Krona'),
  Currency(code: 'NZD', label: 'New Zealand Dollar'),
  Currency(code: 'MXN', label: 'Mexican Peso'),
  Currency(code: 'SGD', label: 'Singapore Dollar'),
  Currency(code: 'HKD', label: 'Hong Kong Dollar'),
  Currency(code: 'NOK', label: 'Norwegian Krone'),
  Currency(code: 'KRW', label: 'South Korean Won'),
  Currency(code: 'TRY', label: 'Turkish Lira'),
  Currency(code: 'RUB', label: 'Russian Ruble'),
  Currency(code: 'INR', label: 'Indian Rupee'),
  Currency(code: 'BRL', label: 'Brazilian Real'),
  Currency(code: 'ZAR', label: 'South African Rand'),
];
