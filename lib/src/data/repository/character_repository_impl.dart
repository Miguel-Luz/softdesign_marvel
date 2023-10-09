import 'package:softdesign_marvel/src/data/datasource/characters_datasource.dart';
import 'package:softdesign_marvel/src/data/exceptions/http_failure.dart';
import 'package:softdesign_marvel/src/data/result/character_result.dart';
import 'package:softdesign_marvel/src/domain/repository/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharactersDatasource _dataSource;

  CharacterRepositoryImpl(this._dataSource);

  @override
  Future<CharactersResult> getCharacters(int offset) async {
    try {
      final result = await _dataSource.get(offset: offset);
      return CharactersResult.success(result);
    } on HttpFailure catch (e) {
      return CharactersResult.error(_handlHttpFailure(e.message));
    } catch (e) {
      return CharactersResult.error('Erro no processamento');
    }
  }

  _handlHttpFailure(Map<String, dynamic> value) {
    int? statusCode;
    try {
      statusCode = int.tryParse(value['code']);
    } catch (e) {
      statusCode = 500;
    }

    if (statusCode! >= 400 && statusCode <= 499) {
      return value['status'];
    }

    return 'Erro no processamento';
  }
}
