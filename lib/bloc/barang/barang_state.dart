part of 'barang_bloc.dart';

abstract class BarangState extends Equatable {
  const BarangState();
}

class BarangInitial extends BarangState {
  @override
  List<Object> get props => [];
}
