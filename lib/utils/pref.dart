import 'package:shared_preferences/shared_preferences.dart';

class UserPref {
  static const _PREF_STATUS = "pref.keyStatus";
  static const _PREF_ID = "pref.keyStatus";
  static const _PREF_JABATAN = "pref.keyJabatan";
  static const _PREF_NAMA = "pref.keyNama";
  static const _PREF_EMAIL = "pref.keyEmail";
  static const _PREF_TOKEN = "pref.keyToken";
  static const _PREF_TELEPON = "pref.keyTelepon";
  static const _PREF_ALAMAT = "pref.keyAlamat";
  static const _PREF_FOTO = "pref.keyFoto";

  void setStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_PREF_STATUS, true);
  }

  Future<bool> getStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_PREF_STATUS);
  }

  void setId(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(_PREF_ID, id);
  }

  Future<int> getId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_PREF_ID);
  }

  void setNama(String nama) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_PREF_NAMA, nama);
  }

  Future<String> getNama() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_PREF_NAMA);
  }

  void setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_PREF_TOKEN, token);
  }

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_PREF_TOKEN);
  }

  void clearData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(_PREF_STATUS);
    prefs.remove(_PREF_ID);
//    prefs.remove(_PREF_JABATAN);
    prefs.remove(_PREF_NAMA);
//    prefs.remove(_PREF_EMAIL);
    prefs.remove(_PREF_TOKEN);
//    prefs.remove(_PREF_TELEPON);
//    prefs.remove(_PREF_ALAMAT);
//    prefs.remove(_PREF_FOTO);
  }
}
