import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: 'id_user')
  int idUser;
  @JsonKey(name: 'id_jabatan')
  int idJabatan;
  @JsonKey(name: 'nama')
  String nama;
  @JsonKey(name: 'email')
  String email;
  @JsonKey(name: 'token')
  String token;
  @JsonKey(name: 'telepon')
  String telepon;
  @JsonKey(name: 'alamat')
  String alamat;
  @JsonKey(name: 'foto')
  String foto;

  User(this.idUser, this.idJabatan, this.nama, this.email, this.token,
      this.telepon, this.alamat, this.foto);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
