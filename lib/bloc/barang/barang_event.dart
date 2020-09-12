part of 'barang_bloc.dart';

abstract class BarangEvent extends Equatable {
  const BarangEvent();

  @override
  List<Object> get props => [];
}

class LoadBarang extends BarangEvent {
  final int idUser;

  const LoadBarang({@required this.idUser}) : assert(idUser != null);

  @override
  List<Object> get props => [idUser];
}
