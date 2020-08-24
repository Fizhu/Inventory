import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory/data/models/data.dart';
import 'package:inventory/data/pref/pref.dart';
import 'package:inventory/data/remote/rest_client.dart';
import 'package:inventory/ui/login/login.dart';
import 'package:inventory/utils/ext.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _name = 'No Data';
  int _idUser;
  final _restClient = RestClient(Dio());
  List<Barang> _listBarang = List();

  _getData() async {
    var _name = await UserPref.getNama();
    var _idUser = await UserPref.getId();
    setState(() {
      this._name = _name;
      this._idUser = _idUser;
    });
    _getListFromServer();
  }

  BottomAppBar _bottomAppBar() {
    return BottomAppBar(
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.person_outline),
            onPressed: () {
              _showLogoutDialog();
            },
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
                Navigator.pushNamedAndRemoveUntil(
                    context, LoginPage.routeName, (r) => false);
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

  Widget _createList(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, position) {
        return GestureDetector(
          onTap: Ext.toast(_listBarang[position].namaBarang),
          child: Card(
            elevation: 2.0,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50.0,
              ),
            ),
          ),
        );
      },
      itemCount: _listBarang.length,
    );
  }

  _getListFromServer() async {
    await _restClient.getBarangById(_idUser).then((value) {
      log(value.toJson().toString());
      if (value.status) {
        List<Barang> listBarang = value.list;
        setState(() {
          _listBarang = listBarang;
        });
      } else {
        Ext.toast(value.message);
      }
    }, onError: (e, s) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT ||
          e.type == DioErrorType.RECEIVE_TIMEOUT) {
        Ext.handleError('Connection Timeout', e.message);
      } else if (e.type == DioErrorType.DEFAULT) {
        Ext.handleError(
            'Connection Problem', e.message + '\n' + 'StackTrace : $s');
      } else {
        Ext.handleError(
            'Something when wrong', e.message + '\n' + 'StackTrace : $s');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _getData();
    return Scaffold(
        appBar: AppBar(
          title: Text('Inventory'),
          centerTitle: true,
        ),
        bottomNavigationBar: _bottomAppBar(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        body: SafeArea(
          child: Container(
            child: _createList(context),
          ),
        ));
  }
}
