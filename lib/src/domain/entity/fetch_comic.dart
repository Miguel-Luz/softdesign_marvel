// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:softdesign_marvel/src/data/dto/comic_dto.dart';

import 'package:softdesign_marvel/src/domain/entity/comics.dart';

class FetchComic {
  List<Comic> comics;
  int? total;
  int? offset;
  int? limit;
  FetchComic({
    required this.comics,
    this.total,
    this.offset,
    this.limit,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'comics': comics.map((x) => x.toMap()).toList(),
      'total': total,
      'offset': offset,
      'limit': limit,
    };
  }

  factory FetchComic.fromMap(Map<String, dynamic>? map) {
    return FetchComic(
      comics:  ComicDto.fromList(map?['data']['results'] ?? []),
      total: map?['total'] != null ? map!['total'] as int : null,
      offset: map?['offset'] != null ? map!['offset'] as int : null,
      limit: map?['limit'] != null ? map!['limit'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FetchComic.fromJson(String source) =>
      FetchComic.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FetchComic(comics: $comics, total: $total, offset: $offset, limit: $limit)';
  }

  @override
  bool operator ==(covariant FetchComic other) {
    if (identical(this, other)) return true;

    return listEquals(other.comics, comics) &&
        other.total == total &&
        other.offset == offset &&
        other.limit == limit;
  }

  @override
  int get hashCode {
    return comics.hashCode ^ total.hashCode ^ offset.hashCode ^ limit.hashCode;
  }
}
