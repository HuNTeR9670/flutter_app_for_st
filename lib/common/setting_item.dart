import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_st/data/models/setting_query.dart';

class SettingItem extends StatelessWidget {
  final SettingQuery setting;
  final Function(bool) onTap;

  const SettingItem({Key? key, required this.setting, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Row(
                    children: [Text(setting.charCode)],
                  ),
                  Row(
                    children: [
                      Flexible(child: Text("${setting.scale} ${setting.name}"))
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Switch(value: setting.enable, onChanged: onTap),
                      const Icon(Icons.view_headline),
                    ],
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
