import 'package:dio/dio.dart' hide Headers;
import 'package:inventory/data/models/data.dart';
import 'package:inventory/utils/app_constant.dart';
import 'package:retrofit/retrofit.dart';

import 'api_endpoint.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: AppConstant.BASE_URL)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST(ApiEndpoint.ENDPOINT_LOGIN)
  @FormUrlEncoded()
  Future<ResponseData> login(
      @Field("email") String email, @Field("password") String password);

  @GET(ApiEndpoint.ENDPOINT_GET_LIST_BARANG_BY_ID)
  Future<ResponseList> getBarangById(@Query("id_user") int idUser);

  @POST(ApiEndpoint.ENDPOINT_INSERT_BARANG)
  @FormUrlEncoded()
  Future<ResponseData> insert(
      @Field("nama_barang") String namaBarang,
      @Field("jumlah") String jumlah,
      @Field("tanggal_masuk") String tanggalMasuk,
      @Field("keterangan") String keterangan,
      @Field("foto") String foto);
}
