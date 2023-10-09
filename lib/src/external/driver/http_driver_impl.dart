import 'package:dio/dio.dart';
import 'package:softdesign_marvel/src/data/data/http_data_request.dart';
import 'package:softdesign_marvel/src/domain/services/build_credential_service.dart';
import 'package:softdesign_marvel/src/external/driver/http_driver.dart';
import 'package:softdesign_marvel/src/data/exceptions/http_failure.dart';

class HttpDriverImpl extends HttpDriver {
  Dio httpClient;
  BuildCredentialService buildCredentialService;

  HttpDriverImpl(
    this.httpClient,
    this.buildCredentialService,
  ) {
    httpClient.options = BaseOptions(
      connectTimeout: const Duration(seconds: 60),
      headers: {
        'Content-Type': 'application/json',
      },
    );
  }

  @override
  Future<dynamic> request(HttpDataRequest requestData) async {
    try {
      buildCredentialService.buildHash();

      final response = await httpClient.request(
        requestData.url,
        queryParameters: {
          'ts': buildCredentialService.timestamp,
          'apikey': buildCredentialService.publicKey,
          'hash': buildCredentialService.hash,
          ...requestData.queryString
        },
        data: requestData.body,
        options: Options(
          method: requestData.httpMethod,
        ),
      );
      return response.data;
    } on DioException catch (error) {
      print("|||||||||||||||||");
      print(error.response!.realUri.toString());
      throw HttpFailure(error.response?.data);
    } catch (e) {
      throw Exception();
    }
  }
}
