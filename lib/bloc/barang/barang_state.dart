part of 'barang_bloc.dart';

abstract class BarangState extends Equatable {
  const BarangState();

  @override
  List<Object> get props => [];
}

class BarangInitial extends BarangState {}

class BarangLoading extends BarangState {}

class BarangHasData extends BarangState {
  final List<Barang> list;

  const BarangHasData([this.list]);

  @override
  List<Object> get props => [list];
}

class BarangHasNoData extends BarangState {
  final String message;

  const BarangHasNoData(this.message);

  @override
  List<Object> get props => [message];
}

class BarangNoConnection extends BarangState {}

class BarangError extends BarangState {
  final String message;

  const BarangError(this.message);

  @override
  List<Object> get props => [message];
}

class BarangPost extends BarangState {}

class BarangPostSuccess extends BarangState {}

class BarangListed extends BarangState {
  final Barang barang;

  const BarangListed(this.barang);

  @override
  List<Object> get props => [barang];
}
