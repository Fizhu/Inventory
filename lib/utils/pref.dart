import 'package:inventory/data/models/data.dart';
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
  static const _PREF_FOTO = 'keyFoto';

  static setStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_PREF_STATUS, true);
  }

  static Future<bool> getStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_PREF_STATUS) ?? false;
  }

  static setId(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(_PREF_ID, id);
  }

  static Future<int> getId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_PREF_ID) ?? 0;
  }

  static setNama(String nama) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_PREF_NAMA, nama);
  }

  static Future<String> getNama() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_PREF_NAMA) ?? 'No data';
  }

  static setEmail(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_PREF_EMAIL, email);
  }

  static Future<String> getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_PREF_EMAIL) ?? 'No data';
  }

  static setIdJabatan(int jabatan) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(_PREF_JABATAN, jabatan);
  }

  static Future<int> getIdJabatan() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_PREF_JABATAN) ?? 0;
  }

  static setTelepon(String telepon) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_PREF_TELEPON, telepon);
  }

  static Future<String> getTelepon() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_PREF_TELEPON) ?? 'No data';
  }

  static setAlamat(String alamat) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_PREF_ALAMAT, alamat);
  }

  static Future<String> getAlamat() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_PREF_ALAMAT) ?? 'No data';
  }

  static setFoto(String foto) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_PREF_FOTO, foto);
  }

  static Future<String> getFoto() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_PREF_FOTO) ?? 'No data';
  }

  static setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_PREF_TOKEN, token);
  }

  static Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_PREF_TOKEN) ?? '';
  }

  static setUser(User user) {
    setId(user.idUser);
    setIdJabatan(user.idJabatan);
    setNama(user.nama);
    setEmail(user.email);
    setToken(user.token);
    setTelepon(user.telepon);
    setAlamat(user.alamat);
    setFoto(user.foto);
  }

  static clearData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(_PREF_STATUS);
    prefs.remove(_PREF_ID);
    prefs.remove(_PREF_JABATAN);
    prefs.remove(_PREF_NAMA);
    prefs.remove(_PREF_EMAIL);
    prefs.remove(_PREF_TOKEN);
    prefs.remove(_PREF_TELEPON);
    prefs.remove(_PREF_ALAMAT);
    prefs.remove(_PREF_FOTO);
  }
}
