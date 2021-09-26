import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_app_st/data/api/service_api.dart';
import 'package:flutter_app_st/data/models/currency_rate.dart';
import 'package:flutter_app_st/di/service_locator.dart';
import 'package:xml2json/xml2json.dart';

class ServiceApiImpl implements ServiceApi {
  late Dio _dio;

  ServiceApiImpl() {
    _dio = serviceLocator.get<Dio>();
  }

  @override
  Future<CurrenciesNetwork> getRatesFromApi(String date) async {
    try {
      var response = await _dio.get(
          'http://www.nbrb.by/Services/XmlExRates.aspx',
          queryParameters: {'ondate': date});
      final converter = Xml2Json();
      converter.parse(response.data);
      var map = jsonDecode(converter.toParkerWithAttrs());
      return CurrenciesNetwork.fromJson(map['DailyExRates']);
    } catch (e) {
      return CurrenciesNetwork(currency: List.empty(), rateDate: '');
    }
  }
}
