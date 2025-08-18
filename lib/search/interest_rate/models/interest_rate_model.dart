class InterestRateModel {
  const InterestRateModel({
    required this.interestKind,
    required this.deposit,
    required this.rate,
  });

  final String interestKind;
  final String deposit;
  final String rate;
}

const List<InterestRateModel> interestRates = [
  InterestRateModel(
    interestKind: 'Individual customers',
    deposit: '1m',
    rate: '4.50%',
  ),
  InterestRateModel(
    interestKind: 'Corporate customers',
    deposit: '2m',
    rate: '5.50%',
  ),
  InterestRateModel(
    interestKind: 'Individual customers',
    deposit: '1m',
    rate: '4.50%',
  ),
  InterestRateModel(
    interestKind: 'Corporate customers',
    deposit: '2m',
    rate: '5.50%',
  ),
  InterestRateModel(
    interestKind: 'Individual customers',
    deposit: '1m',
    rate: '4.50%',
  ),
  InterestRateModel(
    interestKind: 'Corporate customers',
    deposit: '2m',
    rate: '5.50%',
  ),
  InterestRateModel(
    interestKind: 'Individual customers',
    deposit: '1m',
    rate: '4.50%',
  ),
  InterestRateModel(
    interestKind: 'Corporate customers',
    deposit: '2m',
    rate: '5.50%',
  ),
  InterestRateModel(
    interestKind: 'Individual customers',
    deposit: '1m',
    rate: '4.50%',
  ),
  InterestRateModel(
    interestKind: 'Corporate customers',
    deposit: '2m',
    rate: '5.50%',
  ),
];
