import 'dart:convert';

import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Character {
  String id;
  String name;
  String description;
  String thumbnail;
  List<String> comics;
  Character({
    required this.id,
    required this.name,
    required this.description,
    required this.thumbnail,
    required this.comics,
  });

  Character copyWith({
    String? id,
    String? name,
    String? description,
    String? thumbnail,
    List<String>? comics,
  }) {
    return Character(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      thumbnail: thumbnail ?? this.thumbnail,
      comics: comics ?? this.comics,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'thumbnail': thumbnail,
      'comics': comics,
    };
  }

  factory Character.fromMap(Map<String, dynamic> map) {
    return Character(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      thumbnail: map['thumbnail'] as String,
      comics: List<String>.from((map['comics'] as List<String>),
    ));
  }

  String toJson() => json.encode(toMap());

  factory Character.fromJson(String source) => Character.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Character(id: $id, name: $name, description: $description, thumbnail: $thumbnail, comics: $comics)';
  }

  @override
  bool operator ==(covariant Character other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.description == description &&
      other.thumbnail == thumbnail &&
      listEquals(other.comics, comics);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      thumbnail.hashCode ^
      comics.hashCode;
  }
}
