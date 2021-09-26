import 'package:flutter_app_st/data/models/currency_rates_view.dart';

abstract class CurrencyRatesRepository {
  Future<CurrencyRatesView> getRates();
}