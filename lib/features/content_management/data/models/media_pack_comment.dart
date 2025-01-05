import 'dart:convert';

import 'package:apiofa_mob/features/content_management/data/models/media_pack.dart';
import 'package:apiofa_mob/features/user_management/data/models/fan_profile.dart';


class MediaPackComment {
  final int id;
  final int fanProfileId;
  final int mediaPackId;
  final String description;
  final DateTime creationDate;
  final FanProfile fanProfile;
  final MediaPack mediaPack; 

  MediaPackComment({
    required this.id,
    required this.fanProfileId,
    required this.mediaPackId,
    required this.description,
    required this.creationDate,
    required this.fanProfile,
    required this.mediaPack, 
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fanProfileId': fanProfileId,
      'mediaPackId': mediaPackId,
      'description': description,
      'creationDate': creationDate.toIso8601String(),
      'fanProfile': fanProfile.toMap(),
       'mediaPack': mediaPack.toMap(), 
    };
  }

  factory MediaPackComment.fromMap(Map<String, dynamic> map) {
    return MediaPackComment(
      id: map['id'] ?? 0,
      fanProfileId: map['fanProfileId'] ?? 0,
      mediaPackId: map['mediaPackId'] ?? 0,
      description: map['description'] ?? '',
      creationDate: DateTime.parse(map['creationDate']),
      fanProfile: FanProfile.fromMap(map['fanProfile']),
     mediaPack: MediaPack.fromMap(map['mediaPack']), 
    );
  }

  String toJson() => json.encode(toMap());

  factory MediaPackComment.fromJson(String source) => MediaPackComment.fromMap(json.decode(source));

  MediaPackComment copyWith({
    int? id,
    int? fanProfileId,
    int? mediaPackId,
    String? description,
    DateTime? creationDate,
    FanProfile? fanProfile,
    MediaPack? mediaPack,
  }) {
    return MediaPackComment(
      id: id ?? this.id,
      fanProfileId: fanProfileId ?? this.fanProfileId,
      mediaPackId: mediaPackId ?? this.mediaPackId,
      description: description ?? this.description,
      creationDate: creationDate ?? this.creationDate,
      fanProfile: fanProfile ?? this.fanProfile,
       mediaPack: mediaPack ?? this.mediaPack,
    );
  }
}
