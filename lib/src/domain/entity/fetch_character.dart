// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:softdesign_marvel/src/data/dto/characters_dto.dart';

import 'package:softdesign_marvel/src/domain/entity/character.dart';

class FetchCharacter {
  List<Character> charactres;
  int? total;
  int? offset;
  int? limit;

  FetchCharacter({
    required this.charactres,
    this.total,
    this.offset,
    this.limit,
  });

  setData(FetchCharacter data) {
    limit = data.limit;
    offset = data.offset;
    total = data.total;

    charactres.addAll(data.charactres);
  }

  factory FetchCharacter.fromMap(Map<String, dynamic> map) {
    return FetchCharacter(
      charactres: CharacterDto.fromList(map['data']['results']),
      total: map['data']['total'] as int,
      offset: map['data']['offset'] as int,
      limit: map['data']['limit'] as int,
    );
  }

  factory FetchCharacter.fromJson(String source) =>
      FetchCharacter.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FetchCharacter(charactres: $charactres, total: $total, offset: $offset, limit: $limit)';
  }
}
