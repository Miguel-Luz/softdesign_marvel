// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$fetchCharacterAtom =
      Atom(name: 'HomeStoreBase.fetchCharacter', context: context);

  @override
  FetchCharacter get fetchCharacter {
    _$fetchCharacterAtom.reportRead();
    return super.fetchCharacter;
  }

  @override
  set fetchCharacter(FetchCharacter value) {
    _$fetchCharacterAtom.reportWrite(value, super.fetchCharacter, () {
      super.fetchCharacter = value;
    });
  }

  late final _$fetchComicsAtom =
      Atom(name: 'HomeStoreBase.fetchComics', context: context);

  @override
  FetchComic get fetchComics {
    _$fetchComicsAtom.reportRead();
    return super.fetchComics;
  }

  @override
  set fetchComics(FetchComic value) {
    _$fetchComicsAtom.reportWrite(value, super.fetchComics, () {
      super.fetchComics = value;
    });
  }

  late final _$charactersAtom =
      Atom(name: 'HomeStoreBase.characters', context: context);

  @override
  ObservableList<Character> get characters {
    _$charactersAtom.reportRead();
    return super.characters;
  }

  @override
  set characters(ObservableList<Character> value) {
    _$charactersAtom.reportWrite(value, super.characters, () {
      super.characters = value;
    });
  }

  late final _$comicsAtom =
      Atom(name: 'HomeStoreBase.comics', context: context);

  @override
  List<Comic> get comics {
    _$comicsAtom.reportRead();
    return super.comics;
  }

  @override
  set comics(List<Comic> value) {
    _$comicsAtom.reportWrite(value, super.comics, () {
      super.comics = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'HomeStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$fetchAsyncAction =
      AsyncAction('HomeStoreBase.fetch', context: context);

  @override
  Future fetch() {
    return _$fetchAsyncAction.run(() => super.fetch());
  }

  late final _$getComicsAsyncAction =
      AsyncAction('HomeStoreBase.getComics', context: context);

  @override
  Future getComics(String idCharacter) {
    return _$getComicsAsyncAction.run(() => super.getComics(idCharacter));
  }

  @override
  String toString() {
    return '''
fetchCharacter: ${fetchCharacter},
fetchComics: ${fetchComics},
characters: ${characters},
comics: ${comics},
isLoading: ${isLoading}
    ''';
  }
}
