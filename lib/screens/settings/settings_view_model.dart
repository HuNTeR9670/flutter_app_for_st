import 'package:flutter_app_st/data/models/setting_query.dart';
import 'package:flutter_app_st/data/repository/settings_repository.dart';
import 'package:flutter_app_st/di/service_locator.dart';

class SettingsViewModel {
  late SettingsRepository _settingsRepository;

  SettingsViewModel() {
    _settingsRepository = serviceLocator.get<SettingsRepository>();
  }

  getSettings() => _settingsRepository.getSettings();

  changeSetting(bool as, SettingQuery settingQuery) {
    settingQuery.enable = as;
    _settingsRepository.addSetting(settingQuery: settingQuery);
  }

  reorderData(SettingQuery settingQuery, int newPos) {
    settingQuery.position = newPos;
    _settingsRepository.addSetting(settingQuery: settingQuery);
  }
}
