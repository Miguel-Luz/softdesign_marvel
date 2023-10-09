import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:softdesign_marvel/src/data/data/http_data_request.dart';
import 'package:softdesign_marvel/src/domain/entity/comics.dart';
import 'package:softdesign_marvel/src/external/datasource/comics_datasource_impl.dart';
import 'package:softdesign_marvel/src/external/driver/http_driver.dart';

import 'comics_datasource_impl_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<HttpDriver>(),
  MockSpec<HttpDataRequest>(),
])
void main() {
  final httpDriver = MockHttpDriver();
  final datasource = ComicDatasourceImpl(httpDriver);

  test('Devera retornar uma lista de CategoriaModel', () async {
    when(httpDriver.request(any)).thenAnswer((_) async => null);
    final result = await datasource.get('1');
    expect(result.comics, isA<List<Comic>>());
  });

  test('Devera retornar uma lista de CategoriaModel', () async {
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
    final result = await datasource.get('1');
    expect(result.comics, isA<List<Comic>>());
  });
}
