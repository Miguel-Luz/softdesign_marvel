

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Character {
  String? id;
  String? name;
  String? description;
  String? thumbnail;
  List<String>? comics;
  Character({
    required this.id,
    required this.name,
    required this.description,
    required this.thumbnail,
    required this.comics,
  });
}
