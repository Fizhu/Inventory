import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory/data/models/data.dart';
import 'package:inventory/data/pref/pref.dart';
import 'package:inventory/data/remote/rest_client.dart';
import 'package:inventory/ui/login/login.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _name = 'No Data';
  int _idUser;
  final _restClient = RestClient(Dio());
  Future<List<Barang>> _listBarang;

  _getData() async {
    var _name = await UserPref.getNama();
    var _idUser = await UserPref.getId();
    setState(() {
      this._name = _name;
      this._idUser = _idUser;
    });
  }

  BottomAppBar _bottomAppBar() {
    return BottomAppBar(
      clipBehavior: Clip.hardEdge,
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

  ListView _createList(BuildContext context, List<Barang> listBarang) {
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(
        color: Colors.white,
      ),
      itemCount: listBarang.isEmpty ? 0 : listBarang.length,
      itemBuilder: (context, position) {
        return GestureDetector(
          onTap: () {
            log(position.toString());
          },
          child: ListTile(
            leading: FlutterLogo(
              size: 56.0,
            ),
            title: Text(listBarang[position].namaBarang),
            subtitle: Text(listBarang[position].tanggalMasuk),
          ),
        );
      },
    );
  }

  Future<List<Barang>> _getListFromServer() async {
    List<Barang> list = List();
    await _restClient.getBarangById(_idUser).then((value) {
      log('VALUE : ${value.toJson().toString()}');
      var listBarang = value.list;
      listBarang.forEach((element) {
        list.add(Barang.fromJson(element));
      });
    });
    return list;
  }

  _listBuilderWithFuture() => FutureBuilder(
        future: _listBarang,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Barang> list = snapshot.data;
            return list.isNotEmpty
                ? _createList(context, list)
                : Center(
                    child: Text('No Data'),
                  );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      );

  List<Barang> _dummyListBarang() {
    List<Barang> list = List();
    for (var i = 0; i < 15; i++) {
      list.add(Barang(i, i, "Barang $i", 100 + i, "2020-10-10", "gambar.jpg"));
    }
    return list;
  }

  @override
  void initState() {
    _listBarang = _getListFromServer();
    super.initState();
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
        body: _listBuilderWithFuture());
  }
}
