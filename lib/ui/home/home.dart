import 'package:flutter/material.dart';
import 'package:inventory/data/pref/pref.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _mail = '';

  _getData() async {
    var _mail = await UserPref.getEmail();
    setState(() {
      this._mail = _mail;
    });
  }

  @override
  Widget build(BuildContext context) {
    _getData();
    return Scaffold(
        body: SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                onPressed: () { UserPref.clearData(); },
                padding: const EdgeInsets.all(8.0),
                child: Text(_mail),
              ),
            ),
          ]),
        ),
      ),
    ));
  }
}
