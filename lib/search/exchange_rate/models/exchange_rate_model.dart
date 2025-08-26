import 'package:flutter/material.dart';

class ExchangeRateModel {
  const ExchangeRateModel({
    required this.flagImage,
    required this.name,
    required this.buy,
    required this.sell,
  });

  final ImageProvider flagImage;
  final String name;
  final String buy;
  final String sell;
}

final List<ExchangeRateModel> exchangeRates = [
  ExchangeRateModel(
    flagImage: Image.asset('assets/images/vietnam_flag.png').image,
    name: 'Vietnam',
    buy: '1.403',
    sell: '1.746',
  ),
  ExchangeRateModel(
    flagImage: Image.asset('assets/images/nicaragua_flag.png').image,
    name: 'Nicaragua',
    buy: '9.123',
    sell: '12.09',
  ),
  ExchangeRateModel(
    flagImage: Image.asset('assets/images/korea_flag.png').image,
    name: 'Korea',
    buy: '3.704',
    sell: '5.151',
  ),
  ExchangeRateModel(
    flagImage: Image.asset('assets/images/russia_flag.png').image,
    name: 'Russia',
    buy: '116.0',
    sell: '114.4',
  ),
  ExchangeRateModel(
    flagImage: Image.asset('assets/images/china_flag.png').image,
    name: 'China',
    buy: '1.725',
    sell: '2.234',
  ),
  ExchangeRateModel(
    flagImage: Image.asset('assets/images/portugal_flag.png').image,
    name: 'Portugal',
    buy: '1.403',
    sell: '1.746',
  ),
  ExchangeRateModel(
    flagImage: Image.asset('assets/images/france_flag.png').image,
    name: 'France',
    buy: '23.45',
    sell: '34.56',
  ),
];
