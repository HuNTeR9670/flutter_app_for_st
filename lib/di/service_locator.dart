import 'package:dio/dio.dart';
import 'package:flutter_app_st/data/api/service_api.dart';
import 'package:flutter_app_st/data/api/service_api_impl.dart';
import 'package:flutter_app_st/data/database/daos/currencies_dao.dart';
import 'package:flutter_app_st/data/database/daos/rates_dao.dart';
import 'package:flutter_app_st/data/database/daos/settings_dao.dart';
import 'package:flutter_app_st/data/database/database.dart';
import 'package:flutter_app_st/data/repository/currency_rates_repository.dart';
import 'package:flutter_app_st/data/repository/impl/currency_rates_repository_impl.dart';
import 'package:flutter_app_st/data/repository/impl/settings_repository_impl.dart';
import 'package:flutter_app_st/data/repository/settings_repository.dart';
import 'package:flutter_app_st/screens/currencies/currencies_vew_model.dart';
import 'package:flutter_app_st/screens/settings/settings_view_model.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance; // GetIt.I is also valid
void setUp() {
  serviceLocator.registerSingleton<Dio>(createDio());
  serviceLocator.registerSingleton<Database>(Database());
  // register more instances
  serviceLocator.registerFactory<ServiceApi>(() => ServiceApiImpl());

  //Repository
  serviceLocator.registerFactory<CurrencyRatesRepository>(
      () => CurrencyRatesRepositoryImpl());
  serviceLocator
      .registerFactory<SettingsRepository>(() => SettingsRepositoryImpl());

  //DAOs
  serviceLocator.registerFactory<RatesDao>(
      () => RatesDao(serviceLocator.get<Database>()));
  serviceLocator.registerFactory<SettingsDao>(
      () => SettingsDao(serviceLocator.get<Database>()));
  serviceLocator.registerFactory<CurrenciesDao>(
          () => CurrenciesDao(serviceLocator.get<Database>()));

  //ViewModel
  serviceLocator
      .registerFactory<CurrenciesViewModel>(() => CurrenciesViewModel());
  serviceLocator.registerFactory<SettingsViewModel>(() => SettingsViewModel());
}

Dio createDio() {
  var dio = Dio();
  dio.options.headers['Content-Type'] = 'text/xml;charset=utf-8';
  dio.options.headers['Access-Control-Allow-Headers'] =
      'Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale';
  dio.options.headers['Access-Control-Allow-Origin'] = '*';
  dio.options.headers['Access-Control-Allow-Methods'] = 'GET';
  dio.options.headers['Access-Control-Allow-Credentials'] = true;
  //dio.interceptors.add(LogInterceptor(responseBody: true));
  return dio;
}
