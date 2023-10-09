import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class Comic {
  String id;
  String title;
  String thumbnail;
  Comic({
    required this.id,
    required this.title,
    required this.thumbnail,
  });

  Comic copyWith({
    String? id,
    String? title,
    String? thumbnail,
  }) {
    return Comic(
      id: id ?? this.id,
      title: title ?? this.title,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'thumbnail': thumbnail,
    };
  }

  factory Comic.fromMap(Map<String, dynamic> map) {
    return Comic(
      id: map['id'] as String,
      title: map['title'] as String,
      thumbnail: map['thumbnail'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Comic.fromJson(String source) => Comic.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Comics(id: $id, title: $title, thumbnail: $thumbnail)';

  @override
  bool operator ==(covariant Comic other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.title == title &&
      other.thumbnail == thumbnail;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ thumbnail.hashCode;
}
