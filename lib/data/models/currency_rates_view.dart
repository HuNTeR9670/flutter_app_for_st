
class CurrencyRatesView {
  final DateTime nowDate;
  final DateTime secondDate;
  final List<CurrencyRateView> currRates;

  CurrencyRatesView(
      {required this.nowDate, required this.secondDate, required this.currRates});
}

class CurrencyRateView {
  final String numCode;
  final String charCode;
  final String scale;
  final String name;
  final String rateNow;
  final String rateSecond;

  CurrencyRateView(
      {required this.numCode,
      required this.charCode,
      required this.scale,
      required this.name,
      required this.rateNow,
      required this.rateSecond});
}
