// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_rate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrenciesNetwork _$CurrenciesNetworkFromJson(Map<String, dynamic> json) =>
    CurrenciesNetwork(
      currency: (json['Currency'] as List<dynamic>)
          .map((e) => CurrencyRate.fromJson(e as Map<String, dynamic>))
          .toList(),
      rateDate: json['_Date'] as String,
    );

Map<String, dynamic> _$CurrenciesNetworkToJson(CurrenciesNetwork instance) =>
    <String, dynamic>{
      '_Date': instance.rateDate,
      'Currency': instance.currency,
    };

CurrencyRate _$CurrencyRateFromJson(Map<String, dynamic> json) => CurrencyRate(
      numCode: json['NumCode'] as String,
      charCode: json['CharCode'] as String,
      scale: json['Scale'] as String,
      name: json['Name'] as String,
      rate: json['Rate'] as String,
    );

Map<String, dynamic> _$CurrencyRateToJson(CurrencyRate instance) =>
    <String, dynamic>{
      'NumCode': instance.numCode,
      'CharCode': instance.charCode,
      'Scale': instance.scale,
      'Name': instance.name,
      'Rate': instance.rate,
    };
