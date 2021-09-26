import 'package:json_annotation/json_annotation.dart';

part 'currency_rate.g.dart';

@JsonSerializable()
class CurrenciesNetwork {

  @JsonKey(name: "_Date")
  String rateDate;
  @JsonKey(name: 'Currency')
  final List<CurrencyRate> currency;

  CurrenciesNetwork({required this.currency, required this.rateDate});

  factory CurrenciesNetwork.fromJson(Map<String, dynamic> json) =>
      _$CurrenciesNetworkFromJson(json);

  Map<String, dynamic> toJson() => _$CurrenciesNetworkToJson(this);
}

@JsonSerializable()
class CurrencyRate {
  @JsonKey(name: 'NumCode')
  final String numCode;
  @JsonKey(name: 'CharCode')
  final String charCode;
  @JsonKey(name: 'Scale')
  final String scale;
  @JsonKey(name: 'Name')
  final String name;
  @JsonKey(name: 'Rate')
  final String rate;

  CurrencyRate(
      {required this.numCode,
      required this.charCode,
      required this.scale,
      required this.name,
      required this.rate});

  factory CurrencyRate.fromJson(Map<String, dynamic> json) =>
      _$CurrencyRateFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyRateToJson(this);
}
