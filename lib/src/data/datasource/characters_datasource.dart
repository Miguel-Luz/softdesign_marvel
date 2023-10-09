import 'package:softdesign_marvel/src/domain/entity/fetch_character.dart';

abstract class CharactersDatasource {
  Future<FetchCharacter> get({
    int offset,
    int quantity,
  });
}
