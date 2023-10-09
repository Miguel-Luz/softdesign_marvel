// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:softdesign_marvel/src/domain/repository/character_repository.dart';

class GetCharactersUsecase {
  final CharacterRepository _characterRepository;
  GetCharactersUsecase(
    this._characterRepository,
  );

  call() => _characterRepository.getCharacters(0);
}
