import 'package:flutter_app_st/data/api/service_api.dart';
import 'package:flutter_app_st/data/database/daos/currencies_dao.dart';
import 'package:flutter_app_st/data/database/daos/rates_dao.dart';
import 'package:flutter_app_st/data/database/daos/settings_dao.dart';
import 'package:flutter_app_st/data/database/database.dart';
import 'package:flutter_app_st/data/models/currencies_query.dart';
import 'package:flutter_app_st/data/models/currency_rate.dart';
import 'package:flutter_app_st/data/models/currency_rates_view.dart';
import 'package:flutter_app_st/data/repository/currency_rates_repository.dart';
import 'package:flutter_app_st/di/service_locator.dart';
import 'package:intl/intl.dart';

class CurrencyRatesRepositoryImpl implements CurrencyRatesRepository {
  late ServiceApi _serviceApi;
  late RatesDao _ratesDao;
  late SettingsDao _settingsDao;
  late CurrenciesDao _currenciesDao;
  bool _afterListIsEmpty = false;

  CurrencyRatesRepositoryImpl() {
    _serviceApi = serviceLocator.get<ServiceApi>();
    _ratesDao = serviceLocator.get<RatesDao>();
    _settingsDao = serviceLocator.get<SettingsDao>();
    _currenciesDao = serviceLocator.get<CurrenciesDao>();
  }

  @override
  Future<CurrencyRatesView> getRates() async {
    final ratesNow = await _getNowRatesLocal();
    final currencies = await _getNowRatesNetwork();
    if (ratesNow.isEmpty) {
      _ratesDao.addRates(_mergeList(currencies));
    }
    if (await _checkSettingsIsEmpty()) {
      final settings = <Setting>[];
      for (int i = 0; i < currencies.currency.length; i++) {
        settings.add(Setting(
            numCode: currencies.currency[i].numCode,
            enable: true,
            position: i + 1));
      }
      _currenciesDao.addCurrencies(_mergeCurrList(currencies));
      _settingsDao.addSettings(settings);
    }
    final currenciesAfter = await _getAfterRatesNetwork();
    if (currenciesAfter.currency.isNotEmpty) {
      _ratesDao.addRates(_mergeList(currenciesAfter));
    } else if (currenciesAfter.currency.isEmpty) {
      final currenciesBefore = await _getBeforeRatesNetwork();
      _ratesDao.addRates(_mergeList(currenciesBefore));
      _afterListIsEmpty = true;
    }
    return _getCurrencyRates();
  }

  Future<CurrenciesNetwork> _getNowRatesNetwork() {
    final nowDate = DateFormat("MM.dd.yyyy").format(DateTime.now());
    return _serviceApi.getRatesFromApi(nowDate);
  }

  Future<CurrenciesNetwork> _getAfterRatesNetwork() async {
    final afterDate = DateFormat("MM.dd.yyyy")
        .format(DateTime.now().add(const Duration(days: 1)));
    return _serviceApi.getRatesFromApi(afterDate);
  }

  Future<CurrenciesNetwork> _getBeforeRatesNetwork() {
    final beforeDate = DateFormat("MM.dd.yyyy")
        .format(DateTime.now().add(const Duration(days: -1)));
    return _serviceApi.getRatesFromApi(beforeDate);
  }

  Future<List<Rate>> _getNowRatesLocal() {
    final nowDate =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    return _ratesDao.getRates(nowDate);
  }

  List<RatesCompanion> _mergeList(CurrenciesNetwork currencies) {
    final rateDate = DateFormat("MM/dd/yyyy").parse(currencies.rateDate);
    return currencies.currency
        .map((e) => RatesCompanion.insert(
            numCode: e.numCode, currRate: e.rate, dateRate: rateDate))
        .toList();
  }

  List<CurrenciesCompanion> _mergeCurrList(CurrenciesNetwork currencies) {
    return currencies.currency
        .map((e) => CurrenciesCompanion.insert(
            numCode: e.numCode,
            charCode: e.charCode,
            name: e.name,
            scale: e.scale))
        .toList();
  }

  Future<CurrencyRatesView> _getCurrencyRates() async {
    final nowDate =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    final afterDate = DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day + 1);
    final beforeDate = DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day - 1);

    final nowList = await _currenciesDao.getCurrencies(nowDate);
    var secondList = <CurrenciesQuery>[];
    if (!_afterListIsEmpty) {
      secondList = await _currenciesDao.getCurrencies(afterDate);
    } else {
      secondList = await _currenciesDao.getCurrencies(beforeDate);
    }
    return CurrencyRatesView(
        nowDate: _afterListIsEmpty ? beforeDate : nowDate,
        secondDate: _afterListIsEmpty ? nowDate : afterDate,
        currRates: _getRateViewMergeList(nowList, secondList));
  }

  _getRateViewMergeList(
      List<CurrenciesQuery> list1, List<CurrenciesQuery> list2) {
    final resultList = <CurrencyRateView>[];
    for (int i = 0; i < list1.length; i++) {
      resultList.add(CurrencyRateView(
          numCode: list1[i].numCode,
          charCode: list1[i].charCode,
          scale: list1[i].scale,
          name: list1[i].name,
          rateNow: list1[i].rate,
          rateSecond: list2[i].rate));
    }
    return resultList;
  }

  _checkSettingsIsEmpty() async {
    final settings = await _settingsDao.getSettings();
    if (settings.isEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
