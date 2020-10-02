part of 'barang_bloc.dart';

abstract class BarangEvent extends Equatable {
  const BarangEvent();

  @override
  List<Object> get props => [];
}

class LoadBarang extends BarangEvent {}

class InsertBarang extends BarangEvent {
  final Barang barang;

  const InsertBarang(this.barang);

  @override
  List<Object> get props => [barang];
}
