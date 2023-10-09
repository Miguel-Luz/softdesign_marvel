import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';
import 'package:softdesign_marvel/src/domain/entity/character.dart';
import 'package:softdesign_marvel/src/domain/entity/comics.dart';
import 'package:softdesign_marvel/src/domain/entity/fetch_character.dart';
import 'package:softdesign_marvel/src/domain/entity/fetch_comic.dart';
import 'package:softdesign_marvel/src/domain/repository/character_repository.dart';
import 'package:softdesign_marvel/src/domain/repository/comic_repository.dart';
import 'package:softdesign_marvel/src/service_locator.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final repository = locator.get<CharacterRepository>();

  final _comicRepository = locator.get<ComicRepository>();

  @observable
  late FetchCharacter fetchCharacter = FetchCharacter(charactres: []);

  @observable
  late FetchComic fetchComics = FetchComic(comics: []);

  @observable
  ObservableList<Character> characters = ObservableList.of([]);

  @observable
  List<Comic> comics = [];

  @observable
  bool isLoading = false;

  @observable
  bool isLoadingComics = false;

  int? offset;

  @action
  fetch() async {
    isLoading = true;
    offset = (offset != null) ? offset! + 1 : 0;

    final result = await repository.getCharacters(offset!);
    result.when(
      success: (data) {
        fetchCharacter = data;
        characters.addAll(data.charactres);
      },
      error: (data) => _toast(data),
    );

    isLoading = false;
  }

  @action
  getComics(String idCharacter) async {
    isLoadingComics = true;
    final result = await _comicRepository.getComics(idCharacter);
    result.when(
      success: (data) {
        fetchComics = data;

        comics = data.comics;
      },
      error: (data) => _toast(data),
    );
    isLoadingComics = false;
  }

  _toast(String data) => Fluttertoast.showToast(
        msg: data,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 14,
      );
}
