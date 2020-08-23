import 'package:shared_preferences/shared_preferences.dart';

class UserPref {
  static const _PREF_STATUS = 'keyStatus';
  static const _PREF_ID = 'keyId';
  static const _PREF_JABATAN = 'keyJabatan';
  static const _PREF_NAMA = 'keyNama';
  static const _PREF_EMAIL = 'keyEmail';
  static const _PREF_TOKEN = 'keyToken';
  static const _PREF_TELEPON = 'keyTelepon';
  static const _PREF_ALAMAT = 'keyAlamat';
  static const _PREF_FOTO = 'pref.keyFoto';

  static setStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_PREF_STATUS, true);
  }

  static Future<bool> getStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_PREF_STATUS);
  }

  static setId(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(_PREF_ID, id);
  }

  static Future<int> getId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_PREF_ID);
  }

  static setNama(String nama) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_PREF_NAMA, nama);
  }

  static Future<String> getNama() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_PREF_NAMA);
  }

  static setEmail(String nama) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_PREF_EMAIL, nama);
  }

  static Future<String> getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_PREF_EMAIL);
  }

  static setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_PREF_TOKEN, token);
  }

  static Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_PREF_TOKEN);
  }

  static clearData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(_PREF_STATUS);
    prefs.remove(_PREF_ID);
//    prefs.remove(_PREF_JABATAN);
    prefs.remove(_PREF_NAMA);
    prefs.remove(_PREF_EMAIL);
    prefs.remove(_PREF_TOKEN);
//    prefs.remove(_PREF_TELEPON);
//    prefs.remove(_PREF_ALAMAT);
//    prefs.remove(_PREF_FOTO);
  }
}
