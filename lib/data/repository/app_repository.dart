import 'package:dio/dio.dart';
import 'package:inventory/data/models/data.dart';
import 'package:inventory/data/pref/pref.dart';
import 'package:inventory/data/remote/rest_client.dart';
import 'package:inventory/data/repository/repository.dart';

class AppRepository implements Repository {
  RestClient _restClient;

  AppRepository() {
    _restClient = RestClient(Dio());
  }

  @override
  Future<ResponseList> getBarangById(int idUser) async =>
      _restClient.getBarangById(idUser);

  @override
  Future<ResponseData> login(String email, String password) async =>
      _restClient.login(email, password);

  @override
  Future<User> getUser() async => UserPref.getUser();

  @override
  saveUser(User user) async => UserPref.setUser(user);

  @override
  Future<ResponseData> insert(String namaBarang, String jumlah,
      String tanggalMasuk, String keterangan, String foto) async =>
      _restClient.insert(
          namaBarang, jumlah, tanggalMasuk, keterangan, foto);
}
