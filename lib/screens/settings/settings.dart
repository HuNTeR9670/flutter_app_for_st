import 'package:flutter/material.dart';
import 'package:flutter_app_st/common/setting_item.dart';
import 'package:flutter_app_st/data/models/setting_query.dart';
import 'package:flutter_app_st/di/service_locator.dart';
import 'package:flutter_app_st/screens/settings/settings_view_model.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  Widget _buildListView(
    BuildContext context,
    AsyncSnapshot<List<SettingQuery>> snapshot,
  ) {
    if (snapshot.hasError) {
      return Center(child: Text(snapshot.error.toString()));
    }
    if (!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return ReorderableListView(
      padding: const EdgeInsets.all(10),
      onReorder: (int oldIndex, int newIndex) {
        _reorderData(snapshot.requireData[oldIndex], newIndex);
      },
      children: [
        for (final element in snapshot.requireData)
          SettingItem(
            key: ValueKey(element),
            setting: element,
            onTap: (val) => _function(val, element),
          )
      ],
    );
  }

  _function(bool as, SettingQuery settingQuery) {
    serviceLocator.get<SettingsViewModel>().changeSetting(as, settingQuery);
  }

  _reorderData(SettingQuery settingQuery, int newPos) {
    serviceLocator.get<SettingsViewModel>().reorderData(settingQuery, newPos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Курсы валют'),
        ),
        body: Center(
          child: StreamBuilder<List<SettingQuery>>(
            stream: serviceLocator.get<SettingsViewModel>().getSettings(),
            builder: (context, AsyncSnapshot<List<SettingQuery>> snapshot) {
              if (snapshot.hasData) return _buildListView(context, snapshot);
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ));
  }
}
