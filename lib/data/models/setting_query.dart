class SettingQuery {
  final String numCode;
  final String charCode;
  final String scale;
  final String name;
  int position;
  bool enable;

  SettingQuery(
      {required this.numCode,
      required this.charCode,
      required this.scale,
      required this.name,
      required this.position,
      required this.enable});
}
