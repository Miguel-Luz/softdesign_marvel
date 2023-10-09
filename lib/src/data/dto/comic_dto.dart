import 'package:softdesign_marvel/src/domain/entity/comics.dart';

class ComicDto {
  static Comic fromMap(Map<String, dynamic> map) {
    return Comic(
      id: (map['id'] as int).toString(),
      title: map['title'] as String,
      thumbnail: '${map['thumbnail']['path']}.${map['thumbnail']['extension']}',
    );
  }

  static List<Comic> fromList(List<dynamic> list) {
    return list.map((_) => fromMap(_)).toList();
  }
}
