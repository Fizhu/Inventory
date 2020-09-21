import 'package:inventory/data/models/data.dart';

abstract class Repository {
  Future<ResponseData> login(String email, String password);

  Future<ResponseList> getBarangById(int idUser);

  Future<User> getUser();

  saveUser(User user);
}
