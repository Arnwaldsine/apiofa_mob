import 'dart:convert';

class MediaPackUpdate {
  final String? packName;
  final String? description;
  final double? price;
  final int? mediaPackCategoryId;
  final List<int>? medias;

  MediaPackUpdate({
    this.packName,
    this.description,
    this.price,
    this.mediaPackCategoryId,
    this.medias,
  });

  Map<String, dynamic> toMap() {
    return {
      'packName': packName,
      'description': description,
      'price': price,
      'mediaPackCategoryId': mediaPackCategoryId,
      'medias': medias,
    };
  }

  factory MediaPackUpdate.fromMap(Map<String, dynamic> map) {
    return MediaPackUpdate(
      packName: map['packName'],
      description: map['description'],
      price: map['price'],
      mediaPackCategoryId: map['mediaPackCategoryId'],
      medias: List<int>.from(map['medias']),
    );
  }

  String toJson() => json.encode(toMap());

  factory MediaPackUpdate.fromJson(String source) => MediaPackUpdate.fromMap(json.decode(source));

  MediaPackUpdate copyWith({
    String? packName,
    String? description,
    double? price,
    int? mediaPackCategoryId,
    List<int>? medias,
  }) {
    return MediaPackUpdate(
      packName: packName ?? this.packName,
      description: description ?? this.description,
      price: price ?? this.price,
      mediaPackCategoryId: mediaPackCategoryId ?? this.mediaPackCategoryId,
      medias: medias ?? this.medias,
    );
  }
}