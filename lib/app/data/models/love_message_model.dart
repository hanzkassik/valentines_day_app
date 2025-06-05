import 'dart:convert';

class LoveMessageModel {
  String title;
  String content;
  String? image;
  LoveMessageModel({
    required this.title,
    required this.content,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'content': content,
      'image': image,
    };
  }

  factory LoveMessageModel.fromMap(Map<String, dynamic> map) {
    return LoveMessageModel(
      title: map['title'] as String,
      content: map['content'] as String,
      image: map['image'] != null ? map['image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoveMessageModel.fromJson(String source) =>
      LoveMessageModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
