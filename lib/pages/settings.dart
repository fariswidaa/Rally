import 'package:Rally/dummy_data/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  List<Widget> items = DummyDatas.getSettingsTitles()
      .map((String title) => _SettingsPageItem(title))
      .toList();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: items,
    );
  }
}

class _SettingsPageItem extends StatelessWidget {
  _SettingsPageItem(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      textColor: Colors.white,
      child: SizedBox(
        height: 60.0,
        child: Row(
          children: <Widget>[
            Text(title),
          ],
        ),
      ),
      onPressed: () {print('Hello');},
    );
  }
}
