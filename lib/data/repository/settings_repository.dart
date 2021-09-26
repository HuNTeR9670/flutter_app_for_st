import 'package:flutter_app_st/data/models/setting_query.dart';

abstract class SettingsRepository{
  Stream<List<SettingQuery>> getSettings();
  addSettings({required List<SettingQuery> settings});
  addSetting({required SettingQuery settingQuery});
}