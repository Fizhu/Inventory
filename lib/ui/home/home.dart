import 'package:flutter/material.dart';
import 'package:inventory/data/pref/pref.dart';
import 'package:inventory/ui/login/login.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _name = 'No Data';

  _getData() async {
    var _name = await UserPref.getNama();
    setState(() {
      this._name = _name;
    });
  }

  BottomAppBar _bottomAppBar() {
    return BottomAppBar(
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.person_outline),
            onPressed: () {},
          ),
          Text(_name),
        ],
      ),
      shape: CircularNotchedRectangle(),
      notchMargin: 8.0,
    );
  }

  Future<void> _showLogoutDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('OMG, Why?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure want to logout ?'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Go Ahead'),
              onPressed: () {
                UserPref.clearData();
                Navigator.pushNamedAndRemoveUntil(context, LoginPage.routeName,
                    (ModalRoute.withName(LoginPage.routeName)));
              },
            ),
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _getData();
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Inventory'),
          ),
        ),
        bottomNavigationBar: _bottomAppBar(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        body: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child:
                  Column(mainAxisSize: MainAxisSize.max, children: <Widget>[]),
            ),
          ),
        ));
  }
}
