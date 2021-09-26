class CurrenciesQuery {
  final String numCode;
  final String charCode;
  final String scale;
  final String name;
  final String rate;

  CurrenciesQuery(
      {required this.numCode,
      required this.charCode,
      required this.scale,
      required this.name,
      required this.rate});
}
