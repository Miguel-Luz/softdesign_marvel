
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:softdesign_marvel/src/domain/entity/fetch_character.dart';

part 'character_result.freezed.dart';

@freezed
class CharactersResult with _$CharactersResult {
  factory CharactersResult.success(FetchCharacter data) = Success;
  factory CharactersResult.error(String message) = Error;
}