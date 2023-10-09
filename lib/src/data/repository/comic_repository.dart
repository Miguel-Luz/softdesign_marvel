import 'package:softdesign_marvel/src/data/datasource/comics_datasource.dart';
import 'package:softdesign_marvel/src/data/exceptions/http_failure.dart';
import 'package:softdesign_marvel/src/data/result/comic_result.dart';
import 'package:softdesign_marvel/src/domain/repository/comic_repository.dart';

class ComicRepositoryImpl implements ComicRepository {
  final ComicDatasource _dataSource;

  ComicRepositoryImpl(this._dataSource);

  @override
  Future<ComicResult> getComics(
    String idCharacter, {
    int offset = 0,
  }) async {
    try {
      return ComicResult.success(
          await _dataSource.get(idCharacter, offset: offset));
    } on HttpFailure catch (e) {
      return ComicResult.error(_handlHttpFailure(e.message));
    } catch (e) {
      return ComicResult.error('Erro no processamento');
    }
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
