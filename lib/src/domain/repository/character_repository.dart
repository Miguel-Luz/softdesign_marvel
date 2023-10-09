import 'package:softdesign_marvel/src/data/result/character_result.dart';

abstract class CharacterRepository {
  Future<CharactersResult> getCharacters(int offset);
}
