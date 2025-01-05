import 'dart:convert';

import 'package:apiofa_mob/features/content_management/data/models/media.dart';
import 'package:apiofa_mob/features/content_management/data/models/media_pack_comment.dart';
import 'package:apiofa_mob/features/user_management/data/models/creator_profile.dart';

class MediaPack {
  final int id;
  final int creatorId;
  final String packName;
  final String description;
  final double price;
  final DateTime creationDate;
  final CreatorProfile creatorProfile;
  final int mediaPackCategoryId;
  final List<int> mediaPackCategories;
  final List<Media> medias;
  final List<MediaPackComment> mediaPackComments;

  MediaPack({
    required this.id,
    required this.creatorId,
    required this.packName,
    required this.description,
    required this.price,
    required this.creationDate,
    required this.creatorProfile,
    required this.mediaPackCategoryId,
    required this.mediaPackCategories,
    required this.medias,
    required this.mediaPackComments,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'creatorId': creatorId,
      'packName': packName,
      'description': description,
      'price': price,
      'creationDate': creationDate.toIso8601String(),
      'creatorProfile': creatorProfile.toMap(),
      'mediaPackCategoryId': mediaPackCategoryId,
      'mediaPackCategories': mediaPackCategories,
      'medias': medias.map((x) => x.toMap()).toList(),
      'mediaPackComments': mediaPackComments.map((x) => x.toMap()).toList(),
    };
  }

  factory MediaPack.fromMap(Map<String, dynamic> map) {
    return MediaPack(
      id: map['id'] ?? 0,
      creatorId: map['creatorId'] ?? 0,
      packName: map['packName'] ?? '',
      description: map['description'] ?? '',
      price: map['price'] ?? 0.0,
      creationDate: DateTime.parse(map['creationDate'] ?? ''),
      creatorProfile: CreatorProfile.fromMap(map['creatorProfile']),
      mediaPackCategoryId: map['mediaPackCategoryId'] ?? 0,
      mediaPackCategories: List<int>.from(map['mediaPackCategories']),
      medias: List<Media>.from(map['medias']?.map((x) => Media.fromMap(x))),
      mediaPackComments: List<MediaPackComment>.from(map['mediaPackComments']?.map((x) => MediaPackComment.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory MediaPack.fromJson(String source) => MediaPack.fromMap(json.decode(source));

  MediaPack copyWith({
    int? id,
    int? creatorId,
    String? packName,
    String? description,
    double? price,
    DateTime? creationDate,
    CreatorProfile? creatorProfile,
    int? mediaPackCategoryId,
    List<int>? mediaPackCategories,
    List<Media>? medias,
    List<MediaPackComment>? mediaPackComments,
  }) {
    return MediaPack(
      id: id ?? this.id,
      creatorId: creatorId ?? this.creatorId,
      packName: packName ?? this.packName,
      description: description ?? this.description,
      price: price ?? this.price,
      creationDate: creationDate ?? this.creationDate,
      creatorProfile: creatorProfile ?? this.creatorProfile,
      mediaPackCategoryId: mediaPackCategoryId ?? this.mediaPackCategoryId,
      mediaPackCategories: mediaPackCategories ?? this.mediaPackCategories,
      medias: medias ?? this.medias,
      mediaPackComments: mediaPackComments ?? this.mediaPackComments,
    );
  }
}