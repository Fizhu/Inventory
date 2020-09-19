// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseData _$ResponseDataFromJson(Map<String, dynamic> json) {
  return ResponseData(
    status: json['status'] as bool,
    message: json['message'] as String,
    data: json['data'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$ResponseDataToJson(ResponseData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

ResponseList _$ResponseListFromJson(Map<String, dynamic> json) {
  return ResponseList(
    json['status'] as bool,
    json['message'] as String,
    json['total'] as int,
    json['data'] as List,
  );
}

Map<String, dynamic> _$ResponseListToJson(ResponseList instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'total': instance.total,
      'data': instance.list,
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['id_user'] as int,
    json['id_jabatan'] as int,
    json['nama'] as String,
    json['email'] as String,
    json['token'] as String,
    json['telepon'] as int,
    json['alamat'] as String,
    json['foto'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id_user': instance.idUser,
      'id_jabatan': instance.idJabatan,
      'nama': instance.nama,
      'email': instance.email,
      'token': instance.token,
      'telepon': instance.telepon,
      'alamat': instance.alamat,
      'foto': instance.foto,
    };

Barang _$BarangFromJson(Map<String, dynamic> json) {
  return Barang(
    json['id_barang'] as int,
    json['id_user'] as int,
    json['nama_barang'] as String,
    json['keterangan'] as String,
    json['jumlah'] as int,
    json['tanggal_masuk'] as String,
    json['foto'] as String,
  );
}

Map<String, dynamic> _$BarangToJson(Barang instance) => <String, dynamic>{
      'id_barang': instance.idBarang,
      'id_user': instance.idUser,
      'nama_barang': instance.namaBarang,
      'keterangan': instance.keterangan,
      'jumlah': instance.jumlah,
      'tanggal_masuk': instance.tanggalMasuk,
      'foto': instance.foto,
    };
