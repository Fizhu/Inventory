import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:inventory/data/models/data.dart';
import 'package:inventory/data/pref/pref.dart';
import 'package:inventory/data/repository/repository.dart';

part 'barang_event.dart';
part 'barang_state.dart';

class BarangBloc extends Bloc<BarangEvent, BarangState> {
  final Repository repository;

  BarangBloc({this.repository}) : super(BarangInitial());

  @override
  Stream<BarangState> mapEventToState(
    BarangEvent event,
  ) async* {
    if (event is LoadBarang) {
      yield* _mapLoadBarangToState();
    }
  }

  Stream<BarangState> _mapLoadBarangToState() async* {
    try {
      yield BarangLoading();
      var idUser = await UserPref.getId();
      var data = await repository.getBarangById(idUser);
      if (data.status) {
        if (data.list.isNotEmpty) {
          List<Barang> list = List();
          data.list.forEach((element) {
            list.add(Barang.fromJson(element));
          });
          yield BarangHasData(list);
        } else {
          yield BarangHasNoData(data.message);
        }
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT ||
          e.type == DioErrorType.RECEIVE_TIMEOUT) {
        yield BarangNoConnection();
      } else if (e.type == DioErrorType.DEFAULT) {
        yield BarangNoConnection();
      } else {
        yield BarangError(e.toString());
      }
    }
  }
}
