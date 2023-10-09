import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:softdesign_marvel/src/data/datasource/comics_datasource.dart';
import 'package:softdesign_marvel/src/data/exceptions/http_failure.dart';
import 'package:softdesign_marvel/src/data/repository/comic_repository_impl.dart';
import 'package:softdesign_marvel/src/domain/entity/fetch_comic.dart';

import 'comic_repository_impl_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<ComicDatasource>(),
])
void main() {
  final datasource = MockComicDatasource();
  final repository = ComicRepositoryImpl(datasource);

  test('Devera retornar FetchChahttpDriverracter', () async {
    late bool isValid;

    when(datasource.get('1')).thenAnswer((_) async => FetchComic(comics: []));

    final result = await repository.getComics('1');

    result.when(success: (data) {
      isValid = true;
    }, error: (data) {
      isValid = false;
    });

    expect(isValid, true);
  });

  test('Devera retornar FetchChahttpDriverracter', () async {
    late bool isValid;

    when(datasource.get('1', offset: 0)).thenThrow(Exception());

    final result = await repository.getComics('1', offset: 0);

    result.when(success: (data) {
      isValid = false;
    }, error: (data) {
      isValid = true;
    });

    expect(isValid, true);
  });

  test('Devera retornar FetchChahttpDriverracter', () async {
    late bool isValid;

    when(datasource.get('1')).thenThrow(HttpFailure({'message': 'value'}));

    final result = await repository.getComics('1');

    result.when(success: (data) {
      isValid = false;
    }, error: (data) {
      isValid = true;
    });

    expect(isValid, true);
  });
}
