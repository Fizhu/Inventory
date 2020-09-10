import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'barang_event.dart';
part 'barang_state.dart';

class BarangBloc extends Bloc<BarangEvent, BarangState> {
  BarangBloc() : super(BarangInitial());

  @override
  Stream<BarangState> mapEventToState(
    BarangEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
