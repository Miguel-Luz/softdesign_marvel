import 'package:softdesign_marvel/src/data/result/comic_result.dart';

abstract class ComicRepository {
  Future<ComicResult> getComics(
    String idCharacter, {
    int offset,
  });
}
