import 'package:dio/dio.dart' hide Headers;
import 'package:inventory/utils/app_constant.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: AppConstant.BASE_URL)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;
}