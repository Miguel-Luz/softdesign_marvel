import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:softdesign_marvel/src/data/datasource/characters_datasource.dart';
import 'package:softdesign_marvel/src/data/exceptions/http_failure.dart';
import 'package:softdesign_marvel/src/data/repository/character_repository_impl.dart';
import 'package:softdesign_marvel/src/domain/entity/fetch_character.dart';

import 'character_repository_impl_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<CharactersDatasource>(),
])
void main() {
  final datasource = MockCharactersDatasource();
  final repository = CharacterRepositoryImpl(datasource);

  test('Devera retornar FetchChahttpDriverracter', () async {
    late bool isValid;

    when(datasource.get())
        .thenAnswer((_) async => FetchCharacter(charactres: []));

    final result = await repository.getCharacters(1);

    result.when(success: (data) {
      isValid = true;
    }, error: (data) {
      isValid = false;
    });

    expect(isValid, true);
  });

  test('Devera retornar FetchChahttpDriverracter', () async {
    late bool isValid;

    when(datasource.get(offset: 1)).thenThrow(Exception());

    final result = await repository.getCharacters(1);

    result.when(success: (data) {
      isValid = false;
    }, error: (data) {
      isValid = true;
    });

    expect(isValid, true);
  });

  test('Devera retornar FetchChahttpDriverracter', () async {
    late bool isValid;

    when(datasource.get(offset: 1))
        .thenThrow(HttpFailure({'message': 'value'}));

    final result = await repository.getCharacters(1);

    result.when(success: (data) {
      isValid = false;
    }, error: (data) {
      isValid = true;
    });

    expect(isValid, true);
  });
}
