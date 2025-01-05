import 'dart:convert';

class MediaPackCreate {
  final int creatorId;
  final String packName;
  final String description;
  final double price;
  final DateTime creationDate;
  final int mediaPackCategoryId;
  final List<int> medias;

  MediaPackCreate({
    required this.creatorId,
    required this.packName,
    required this.description,
    required this.price,
    required this.creationDate,
    required this.mediaPackCategoryId,
    required this.medias,
  });

  Map<String, dynamic> toMap() {
    return {
      'creatorId': creatorId,
      'packName': packName,
      'description': description,
      'price': price,
      'creationDate': creationDate.toIso8601String(),
      'mediaPackCategoryId': mediaPackCategoryId,
      'medias': medias,
    };
  }

  factory MediaPackCreate.fromMap(Map<String, dynamic> map) {
    return MediaPackCreate(
      creatorId: map['creatorId'] ?? 0,
      packName: map['packName'] ?? '',
      description: map['description'] ?? '',
      price: map['price'] ?? 0.0,
      creationDate: DateTime.parse(map['creationDate'] ?? ''),
      mediaPackCategoryId: map['mediaPackCategoryId'] ?? 0,
      medias: List<int>.from(map['medias']),
    );
  }

  String toJson() => json.encode(toMap());

  factory MediaPackCreate.fromJson(String source) => MediaPackCreate.fromMap(json.decode(source));

  MediaPackCreate copyWith({
    int? creatorId,
    String? packName,
    String? description,
    double? price,
    DateTime? creationDate,
    int? mediaPackCategoryId,
    List<int>? medias,
  }) {
    return MediaPackCreate(
      creatorId: creatorId ?? this.creatorId,
      packName: packName ?? this.packName,
      description: description ?? this.description,
      price: price ?? this.price,
      creationDate: creationDate ?? this.creationDate,
      mediaPackCategoryId: mediaPackCategoryId ?? this.mediaPackCategoryId,
      medias: medias ?? this.medias,
    );
  }
}