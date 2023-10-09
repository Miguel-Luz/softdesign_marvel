import 'package:softdesign_marvel/src/domain/entity/fetch_comic.dart';

abstract class ComicDatasource {
  Future<FetchComic> get(
    String idCharacter, {
    int offset,
    int quantity,
  });
}
