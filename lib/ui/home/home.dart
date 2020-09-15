import 'dart:async';
import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory/bloc/barang/barang_bloc.dart';
import 'package:inventory/data/models/data.dart';
import 'package:inventory/data/pref/pref.dart';
import 'package:inventory/ui/login/login.dart';
import 'package:inventory/utils/ext.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _name = 'No Data';
  Completer<void> _refreshCompleter;

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
            Ext.toast(listBarang[position].namaBarang);
          },
          child: ListTile(
            leading: Container(
              width: 54.0,
              height: 54.0,
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  child: CachedNetworkImage(
                    imageUrl: listBarang[position].foto,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Image.asset(
                      'assets/images/noimage.png',
                      fit: BoxFit.fill,
                    ),
                    fit: BoxFit.fill,
                  )),
            ),
            title: Text(listBarang[position].namaBarang),
            subtitle: Text(listBarang[position].tanggalMasuk),
          ),
        );
      },
    );
  }

  GridView _createGrid(BuildContext context, List<Barang> listBarang) {
    return GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.all(8.0),
      children: listBarang
          .map((e) => GestureDetector(
                onTap: () {
                  log(listBarang.indexOf(e).toString());
                  Ext.toast(e.namaBarang);
                },
                child: Card(
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        imageUrl: e.foto,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            Image.asset(
                              'assets/images/noimage.png',
                              fit: BoxFit.fill,
                            ),
                        fit: BoxFit.fill,
                      )
                    ],
                  ),
                ),
              ))
          .toList(),
    );
  }

  Future<void> _refresh() {
    context.bloc<BarangBloc>().add(LoadBarang());
    return _refreshCompleter.future;
  }

  _completeRefresh() {
    _refreshCompleter?.complete();
    _refreshCompleter = Completer();
  }

  _errorHandling(String message) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(child: Text(message)),
          SizedBox(height: 16.0),
          Center(
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              textColor: Colors.white,
              onPressed: () {
                context.bloc<BarangBloc>().add(LoadBarang());
              },
              child: Text('Retry'),
            ),
          ),
        ],
      );

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer<void>();
    context.bloc<BarangBloc>().add(LoadBarang());
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
        body: RefreshIndicator(
          onRefresh: _refresh,
          child: BlocBuilder<BarangBloc, BarangState>(
            builder: (context, state) {
              if (state is BarangLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is BarangHasData) {
                _completeRefresh();
                return _createGrid(context, state.list);
              } else if (state is BarangHasNoData) {
                _completeRefresh();
                return Center(
                  child: Text(state.message),
                );
              } else if (state is BarangNoConnection) {
                _completeRefresh();
                return _errorHandling('Connection Problem');
              } else {
                _completeRefresh();
                return _errorHandling('Something went wrong');
              }
            },
          ),
        ));
  }
}
