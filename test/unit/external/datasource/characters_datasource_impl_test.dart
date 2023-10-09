import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:softdesign_marvel/src/data/data/http_data_request.dart';
import 'package:softdesign_marvel/src/domain/entity/character.dart';
import 'package:softdesign_marvel/src/external/datasource/characters_datasource_impl.dart';
import 'package:softdesign_marvel/src/external/driver/http_driver.dart';

import 'characters_datasource_impl_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<HttpDriver>(),
  MockSpec<HttpDataRequest>(),
])
void main() {
  final httpDriver = MockHttpDriver();
  final datasource = CharactersDatasourceImpl(httpDriver);

  test('Devera retornar FetchCharacter', () async {
    when(httpDriver.request(any)).thenAnswer((_) async => null);
    final result = await datasource.get();
    expect(result.charactres, isA<List<Character>>());
  });

  test('Devera retornar FetchCharacter', () async {
    when(httpDriver.request(any)).thenAnswer(
      (_) async => {
        'data': {
          'results': [],
          'total': 1,
          'offset': 1,
          'limit': 1,
        }
      },
    );
    final result = await datasource.get();
    expect(result.charactres, isA<List<Character>>());
  });
}
