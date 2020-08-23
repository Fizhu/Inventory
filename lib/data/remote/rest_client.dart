import 'package:dio/dio.dart' hide Headers;
import 'package:inventory/data/models/data.dart';
import 'package:inventory/utils/app_constant.dart';
import 'package:retrofit/retrofit.dart';

import 'api_endpoint.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: AppConstant.BASE_URL)
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;

  @POST(ApiEndpoint.ENDPOINT_LOGIN)
  @FormUrlEncoded()
  Future<ResponseData> login(
      @Field("email") String email, @Field("password") String password);
}
