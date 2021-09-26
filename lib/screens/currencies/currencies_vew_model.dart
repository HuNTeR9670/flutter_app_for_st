import 'package:flutter_app_st/data/models/currency_rates_view.dart';
import 'package:flutter_app_st/data/repository/currency_rates_repository.dart';
import 'package:flutter_app_st/di/service_locator.dart';

class CurrenciesViewModel {
  late CurrencyRatesRepository _currencyRatesRepository;

  CurrenciesViewModel() {
    _currencyRatesRepository = serviceLocator.get<CurrencyRatesRepository>();
  }

  Future<CurrencyRatesView> getRates() => _currencyRatesRepository.getRates();
}