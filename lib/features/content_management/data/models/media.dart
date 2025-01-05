import 'dart:convert';
import 'dart:io';

import 'media_type.dart';

class Media {
  final int id;
  final File? content;
  final String description;
  final DateTime uploadDate;
  final MediaType mediaType;

  Media({
    required this.id,
    required this.content,
    required this.description,
    required this.uploadDate,
    required this.mediaType,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content?.path,
      'description': description,
      'uploadDate': uploadDate.toIso8601String(),
      'mediaType': mediaType.toMap(),
    };
  }

  factory Media.fromMap(Map<String, dynamic> map) {
    return Media(
      id: map['id'] ?? 0,
      content: map['content'] != null ? File(map['content']) : null,
      description: map['description'] ?? '',
      uploadDate: DateTime.parse(map['uploadDate']),
      mediaType: MediaType.fromMap(map['mediaType']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Media.fromJson(String source) => Media.fromMap(json.decode(source));

  Media copyWith({
    int? id,
    File? content,
    String? description,
    DateTime? uploadDate,
    MediaType? mediaType,
  }) {
    return Media(
      id: id ?? this.id,
      content: content ?? this.content,
      description: description ?? this.description,
      uploadDate: uploadDate ?? this.uploadDate,
      mediaType: mediaType ?? this.mediaType,
    );
  }
}