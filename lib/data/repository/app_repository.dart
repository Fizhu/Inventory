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
  Future<ResponseList> getBarangById(int idUser) async {
    final data = await _restClient.getBarangById(idUser);
    return data;
  }

  @override
  Future<ResponseData> login(String email, String password) {
    final data = _restClient.login(email, password);
    return data;
  }
}
