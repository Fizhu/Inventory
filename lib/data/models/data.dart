import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class ResponseData {
  @JsonKey(name: 'status')
  final bool status;
  @JsonKey(name: 'message')
  final String message;
  @JsonKey(name: 'data')
  final Map<String, dynamic> data;

  ResponseData({this.status, this.message, this.data});

  factory ResponseData.fromJson(Map<String, dynamic> json) =>
      _$ResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseDataToJson(this);
}

@JsonSerializable()
class ResponseList {
  @JsonKey(name: 'status')
  final bool status;
  @JsonKey(name: 'message')
  final String message;
  @JsonKey(name: 'total')
  final int total;
  @JsonKey(name: 'data')
  final List<dynamic> list;


  ResponseList(this.status, this.message, this.total, this.list);

  factory ResponseList.fromJson(Map<String, dynamic> json) =>
      _$ResponseListFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseListToJson(this);
}

@JsonSerializable()
class User {
  @JsonKey(name: 'id_user')
  final int idUser;
  @JsonKey(name: 'id_jabatan')
  final int idJabatan;
  @JsonKey(name: 'nama')
  final String nama;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'token')
  final String token;
  @JsonKey(name: 'telepon')
  final int telepon;
  @JsonKey(name: 'alamat')
  final String alamat;
  @JsonKey(name: 'foto')
  final String foto;

  User(this.idUser, this.idJabatan, this.nama, this.email, this.token,
      this.telepon, this.alamat, this.foto);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Barang {
  @JsonKey(name: 'id_barang')
  final int idBarang;
  @JsonKey(name: 'id_user')
  final int idUser;
  @JsonKey(name: 'nama_barang')
  final String namaBarang;
  @JsonKey(name: 'jumlah')
  final int jumlah;
  @JsonKey(name: 'tanggal_masuk')
  final String tanggalMasuk;
  @JsonKey(name: 'foto')
  final String foto;

  Barang(this.idBarang, this.idUser, this.namaBarang, this.jumlah,
      this.tanggalMasuk, this.foto);

  factory Barang.fromJson(Map<String, dynamic> json) => _$BarangFromJson(json);

  Map<String, dynamic> toJson() => _$BarangToJson(this);
}
