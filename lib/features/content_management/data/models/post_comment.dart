import 'dart:convert';

import 'package:apiofa_mob/features/user_management/data/models/fan_profile.dart';

class PostComment {
  final int id;
  final String text;
  final DateTime commentDate;
  final int fanProfileId;
  final FanProfile fanProfile;
  final int parentId;

  PostComment({
    required this.id,
    required this.text,
    required this.commentDate,
    required this.fanProfileId,
    required this.fanProfile,
    required this.parentId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
      'commentDate': commentDate.toIso8601String(),
      'fanProfileId': fanProfileId,
      'fanProfile': fanProfile.toMap(),
      'parentId': parentId,
    };
  }

  factory PostComment.fromMap(Map<String, dynamic> map) {
    return PostComment(
      id: map['id'],
      text: map['text'],
      commentDate: DateTime.parse(map['commentDate']),
      fanProfileId: map['fanProfileId'],
      fanProfile: FanProfile.fromMap(map['fanProfile']),
      parentId: map['parentId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PostComment.fromJson(String source) => PostComment.fromMap(json.decode(source));

  PostComment copyWith({
    int? id,
    String? text,
    DateTime? commentDate,
    int? fanProfileId,
    FanProfile? fanProfile,
    int? parentId,
  }) {
    return PostComment(
      id: id ?? this.id,
      text: text ?? this.text,
      commentDate: commentDate ?? this.commentDate,
      fanProfileId: fanProfileId ?? this.fanProfileId,
      fanProfile: fanProfile ?? this.fanProfile,
      parentId: parentId ?? this.parentId,
    );
  }
}