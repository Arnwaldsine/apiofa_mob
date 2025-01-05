import 'dart:convert';

import 'package:apiofa_mob/features/content_management/data/models/media.dart';
import 'package:apiofa_mob/features/content_management/data/models/post_comment.dart';
import 'package:apiofa_mob/features/user_management/data/models/creator_profile.dart';

class Post {
  final int id;
  final String title;
  final String description;
  final CreatorProfile creator;
  final bool isHidden;
  final bool isDeleted;
  final DateTime creationDate;
  final List<Media> medias;
  final List<PostComment> comments;
  final List<int>? mediasToDelete;

  Post({
    required this.id,
    required this.title,
    required this.description,
    required this.creator,
    required this.isHidden,
    required this.isDeleted,
    required this.creationDate,
    required this.medias,
    required this.comments,
    this.mediasToDelete,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'creator': creator.toMap(),
      'isHidden': isHidden,
      'isDeleted': isDeleted,
      'creationDate': creationDate.toIso8601String(),
      'medias': medias.map((media) => media.toMap()).toList(),
      'comments': comments.map((comment) => comment.toMap()).toList(),
      'mediasToDelete': mediasToDelete,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      creator: CreatorProfile.fromMap(map['creator']),
      isHidden: map['isHidden'],
      isDeleted: map['isDeleted'],
      creationDate: DateTime.parse(map['creationDate']),
      medias: List<Media>.from(map['medias']?.map((x) => Media.fromMap(x))),
      comments: List<PostComment>.from(map['comments']?.map((x) => PostComment.fromMap(x))),
      mediasToDelete: map['mediasToDelete'] != null ? List<int>.from(map['mediasToDelete']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) => Post.fromMap(json.decode(source));

  Post copyWith({
    int? id,
    String? title,
    String? description,
    CreatorProfile? creator,
    bool? isHidden,
    bool? isDeleted,
    DateTime? creationDate,
    List<Media>? medias,
    List<PostComment>? comments,
    List<int>? mediasToDelete,
  }) {
    return Post(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      creator: creator ?? this.creator,
      isHidden: isHidden ?? this.isHidden,
      isDeleted: isDeleted ?? this.isDeleted,
      creationDate: creationDate ?? this.creationDate,
      medias: medias ?? this.medias,
      comments: comments ?? this.comments,
      mediasToDelete: mediasToDelete ?? this.mediasToDelete,
    );
  }
}
