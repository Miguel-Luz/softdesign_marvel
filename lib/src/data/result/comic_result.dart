
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:softdesign_marvel/src/domain/entity/fetch_comic.dart';

 part 'comic_result.freezed.dart';
@freezed
class ComicResult with _$ComicResult {
  factory ComicResult.success(FetchComic data) = Success;
  factory ComicResult.error(String message) = Error;
}