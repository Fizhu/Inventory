part of 'barang_bloc.dart';

abstract class BarangEvent extends Equatable {
  const BarangEvent();

  @override
  List<Object> get props => [];
}

class LoadBarang extends BarangEvent {}
