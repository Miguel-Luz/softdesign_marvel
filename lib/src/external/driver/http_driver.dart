import 'package:softdesign_marvel/src/data/data/http_data_request.dart';

abstract class HttpDriver {
  Future<dynamic> request(
    HttpDataRequest requestData,
  );
}
