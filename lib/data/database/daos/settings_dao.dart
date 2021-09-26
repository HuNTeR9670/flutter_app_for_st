import 'package:flutter_app_st/data/database/database.dart';
import 'package:flutter_app_st/data/models/setting_query.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'settings_dao.g.dart';

@UseDao(tables: [Currencies, Settings])
class SettingsDao extends DatabaseAccessor<Database> with _$SettingsDaoMixin {
  SettingsDao(Database db) : super(db);

  Stream<List<SettingQuery>> getSettingsStream() {
    final query = select(settings)
        .join([innerJoin(currencies, currencies.numCode.equalsExp(settings.numCode))])
      ..orderBy([
        (OrderingTerm(expression: settings.position, mode: OrderingMode.asc))
      ]);
    return query
        .map((val) => SettingQuery(
            numCode: val.rawData.read<String>("currencies.num_code"),
            charCode: val.rawData.read<String>('currencies.char_code'),
            scale: val.rawData.read<String>('currencies.scale'),
            name: val.rawData.read<String>('currencies.name'),
            position: val.rawData.read('settings.position'),
            enable: val.rawData.read('settings.enable')))
        .watch();
  }

  Future<List<Setting>> getSettings() => select(settings).get();

  addSettings(List<Setting> settingList) async =>
      batch((batch) => batch.insertAllOnConflictUpdate(settings, settingList));

  addSetting(Setting setting) async =>
      into(settings).insertOnConflictUpdate(setting);
}
