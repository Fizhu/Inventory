// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??= 'https://bus.unila.ac.id/crud/api/v1/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  login(email, password) async {
    ArgumentError.checkNotNull(email, 'email');
    ArgumentError.checkNotNull(password, 'password');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'email': email, 'password': password};
    _data.removeWhere((k, v) => v == null);
    final Response<Map<String, dynamic>> _result = await _dio.request(
        'login.php',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            contentType: 'application/x-www-form-urlencoded',
            baseUrl: baseUrl),
        data: _data);
    final value = ResponseData.fromJson(_result.data);
    return value;
  }

  @override
  getBarangById(idUser) async {
    ArgumentError.checkNotNull(idUser, 'idUser');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'id_user': idUser};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        'getlistbarangbyid.php',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ResponseList.fromJson(_result.data);
    return value;
  }

  @override
  insert(namaBarang, jumlah, tanggalMasuk, keterangan, foto) async {
    ArgumentError.checkNotNull(namaBarang, 'namaBarang');
    ArgumentError.checkNotNull(jumlah, 'jumlah');
    ArgumentError.checkNotNull(tanggalMasuk, 'tanggalMasuk');
    ArgumentError.checkNotNull(keterangan, 'keterangan');
    ArgumentError.checkNotNull(foto, 'foto');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {
      'nama_barang': namaBarang,
      'jumlah': jumlah,
      'tanggal_masuk': tanggalMasuk,
      'keterangan': keterangan,
      'foto': foto
    };
    _data.removeWhere((k, v) => v == null);
    final Response<Map<String, dynamic>> _result = await _dio.request(
        'insertbarang.php',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            contentType: 'application/x-www-form-urlencoded',
            baseUrl: baseUrl),
        data: _data);
    final value = ResponseData.fromJson(_result.data);
    return value;
  }
}
