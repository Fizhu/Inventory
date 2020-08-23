// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseData _$ResponseDataFromJson(Map<String, dynamic> json) {
  return ResponseData(
    json['status'] as bool,
    json['message'] as String,
    json['data'] == null
        ? null
        : User.fromJson(json['data'] as Map<String, dynamic>),
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
    json['data'] as List,
  );
}

Map<String, dynamic> _$ResponseListToJson(ResponseList instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.list,
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['id_user'] as int,
    json['id_jabatan'] as int,
    json['nama'] as String,
    json['email'] as String,
    json['token'] as String,
    json['telepon'] as String,
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
