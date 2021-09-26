import 'package:flutter_app_st/data/models/currency_rate.dart';

abstract class ServiceApi {
  Future<CurrenciesNetwork> getRatesFromApi(String date);
}