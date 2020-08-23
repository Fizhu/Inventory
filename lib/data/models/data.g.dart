// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
