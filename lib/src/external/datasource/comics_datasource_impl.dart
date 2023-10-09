import 'package:softdesign_marvel/src/data/data/http_data_request.dart';
import 'package:softdesign_marvel/src/data/datasource/comics_datasource.dart';
import 'package:softdesign_marvel/src/domain/entity/fetch_comic.dart';
import 'package:softdesign_marvel/src/external/driver/http_driver.dart';

class ComicDatasourceImpl extends ComicDatasource {
  final HttpDriver httpDriver;

  ComicDatasourceImpl(this.httpDriver);

  @override
  Future<FetchComic> get(
    String idCharacter, {
    offset = 0,
    quantity = 20,
  }) async {
    var requestData = HttpDataRequest(
        path: '/public/characters/$idCharacter/comics',
        queryString: {
          'offset': offset,
          'limit': quantity,
        });
    return httpDriver.request(requestData).then(
      (data) {
        return FetchComic.fromMap(data);
      },
    );
  }
}
