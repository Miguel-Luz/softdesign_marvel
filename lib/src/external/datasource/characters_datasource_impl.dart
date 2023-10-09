import 'package:softdesign_marvel/src/data/data/http_data_request.dart';
import 'package:softdesign_marvel/src/domain/entity/fetch_character.dart';
import 'package:softdesign_marvel/src/external/driver/http_driver.dart';
import 'package:softdesign_marvel/src/data/datasource/characters_datasource.dart';

class CharactersDatasourceImpl implements CharactersDatasource {
  final HttpDriver httpDriver;

  CharactersDatasourceImpl(this.httpDriver);

  @override
  Future<FetchCharacter> get({
    offset = 0,
    quantity = 20,
  }) async {
    var requestData = HttpDataRequest(path: '/public/characters', queryString: {
      'offset': offset,
      'limit': quantity,
    });
    return httpDriver.request(requestData).then(
      (data) {
        return FetchCharacter.fromMap(data);
      },
    );
  }
}
