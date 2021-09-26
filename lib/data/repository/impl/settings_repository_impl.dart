import 'package:flutter_app_st/data/database/daos/settings_dao.dart';
import 'package:flutter_app_st/data/database/database.dart';
import 'package:flutter_app_st/data/models/setting_query.dart';
import 'package:flutter_app_st/data/repository/settings_repository.dart';
import 'package:flutter_app_st/di/service_locator.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  late SettingsDao _settingsDao;

  SettingsRepositoryImpl() {
    _settingsDao = serviceLocator.get<SettingsDao>();
  }

  @override
  addSettings({required List<SettingQuery> settings}) {
    _settingsDao.addSettings(settings
        .map((e) =>
            Setting(numCode: e.numCode, enable: e.enable, position: e.position))
        .toList());
  }

  @override
  Stream<List<SettingQuery>> getSettings() => _settingsDao.getSettingsStream();

  @override
  addSetting({required SettingQuery settingQuery}) {
    _settingsDao.addSetting(Setting(
        numCode: settingQuery.numCode,
        enable: settingQuery.enable,
        position: settingQuery.position));
  }
}
