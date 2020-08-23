import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class ResponseData {
  @JsonKey(name: 'status')
  bool status;
  @JsonKey(name: 'message')
  String message;
  @JsonKey(name: 'data')
  Map<String, dynamic> data;

  ResponseData(this.status, this.message, this.data);

  factory ResponseData.fromJson(Map<String, dynamic> json) => _$ResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseDataToJson(this);

}

@JsonSerializable()
class ResponseList {
  @JsonKey(name: 'status')
  bool status;
  @JsonKey(name: 'message')
  String message;
  @JsonKey(name: 'data')
  List<dynamic> list;

  ResponseList(this.status, this.message, this.list);

  factory ResponseList.fromJson(Map<String, dynamic> json) => _$ResponseListFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseListToJson(this);

}

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
