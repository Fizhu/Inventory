import 'package:flutter/material.dart';
import 'package:inventory/ui/detail/detail.dart';
import 'package:inventory/utils/navigation.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
                onPressed: () {
                  Navigation.intent(context, DetailPage.routeName);
                },
                padding: const EdgeInsets.all(8.0),
                child: const Text('Detail'),
              ),
            ),
          ]),
        ),
      ),
    ));
  }
}
