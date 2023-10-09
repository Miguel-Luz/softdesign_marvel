import 'package:softdesign_marvel/src/domain/entity/character.dart';

extension CharacterDto on Character {
  static Character fromMap(Map<String, dynamic> map) {
    return Character(
      id:  (map['id'] as int ).toString(),
      name: map['name'] as String,
      description: map['description'] as String,
      thumbnail: '${map['thumbnail']['path']}.${map['thumbnail']['extension']}',
      comics: List<String>.from(
        (map['comics']['items'] as List).map(
          (e) => e['resourceURI'],
        ),
      ),
    );
  }

  static List<Character> fromList(List<dynamic> list) {
    return list.map((_) => fromMap(_)).toList();
  }
}
