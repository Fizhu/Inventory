import 'package:dio/dio.dart';
import 'package:inventory/data/models/data.dart';
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
}
