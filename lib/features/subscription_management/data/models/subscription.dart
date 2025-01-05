import 'dart:convert';

import 'package:apiofa_mob/features/content_management/data/models/media_pack.dart';
import 'package:apiofa_mob/features/subscription_management/data/models/subscription_status.dart';
import 'package:apiofa_mob/features/subscription_management/data/models/subscription_type.dart';
import 'package:apiofa_mob/features/user_management/data/models/creator_profile.dart';
import 'package:apiofa_mob/features/user_management/data/models/fan_profile.dart';

class Subscription {
  final int id;
  final int subscriptionTypeId;
  final SubscriptionType subscriptionType;
  final FanProfile fanProfile;
  final int fanProfileId;
  final CreatorProfile? creatorProfile;
  final int? creatorProfileId;
  final MediaPack? subscribedPack;
  final int? mediaPackId;
  final DateTime startDate;
  final DateTime? endDate;
  final int subscriptionStateId;
  final SubscriptionStatus subscriptionState;

  Subscription({
    required this.id,
    required this.subscriptionTypeId,
    required this.subscriptionType,
    required this.fanProfile,
    required this.fanProfileId,
    this.creatorProfile,
    this.creatorProfileId,
    this.subscribedPack,
    this.mediaPackId,
    required this.startDate,
    this.endDate,
    required this.subscriptionStateId,
    required this.subscriptionState,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'subscriptionTypeId': subscriptionTypeId,
      'fanProfileId': fanProfileId,
      'creatorProfileId': creatorProfileId,
      'mediaPackId': mediaPackId,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate?.toIso8601String(),
      'subscriptionStateId': subscriptionStateId,
    };
  }

  factory Subscription.fromMap(Map<String, dynamic> map) {
    return Subscription(
      id: map['id'] ?? 0,
      subscriptionTypeId: map['subscriptionTypeId'] ?? 0,
      subscriptionType: SubscriptionType.fromMap(map['subscriptionType']),
      fanProfile: FanProfile.fromMap(map['fanProfile']),
      fanProfileId: map['fanProfileId'] ?? 0,
      creatorProfile: map['creatorProfile'] != null ? CreatorProfile.fromMap(map['creatorProfile']) : null,
      creatorProfileId: map['creatorProfileId'],
      subscribedPack: map['subscribedPack'] != null ? MediaPack.fromMap(map['subscribedPack']) : null,
      mediaPackId: map['mediaPackId'],
      startDate: DateTime.parse(map['startDate'] ?? ''),
      endDate: map['endDate'] != null ? DateTime.parse(map['endDate']) : null,
      subscriptionStateId: map['subscriptionStateId'] ?? 0,
      subscriptionState: SubscriptionStatus.fromMap(map['subscriptionState']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Subscription.fromJson(String source) => Subscription.fromMap(json.decode(source));

  Subscription copyWith({
    int? id,
    int? subscriptionTypeId,
    SubscriptionType? subscriptionType,
    FanProfile? fanProfile,
    int? fanProfileId,
    CreatorProfile? creatorProfile,
    int? creatorProfileId,
    MediaPack? subscribedPack,
    int? mediaPackId,
    DateTime? startDate,
    DateTime? endDate,
    int? subscriptionStateId,
    SubscriptionStatus? subscriptionState,
  }) {
    return Subscription(
      id: id ?? this.id,
      subscriptionTypeId: subscriptionTypeId ?? this.subscriptionTypeId,
      subscriptionType: subscriptionType ?? this.subscriptionType,
      fanProfile: fanProfile ?? this.fanProfile,
      fanProfileId: fanProfileId ?? this.fanProfileId,
      creatorProfile: creatorProfile ?? this.creatorProfile,
      creatorProfileId: creatorProfileId ?? this.creatorProfileId,
      subscribedPack: subscribedPack ?? this.subscribedPack,
      mediaPackId: mediaPackId ?? this.mediaPackId,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      subscriptionStateId: subscriptionStateId ?? this.subscriptionStateId,
      subscriptionState: subscriptionState ?? this.subscriptionState,
    );
  }
}


// Validation methods

String? validateStartDate(DateTime value) {
  if (value.isAfter(DateTime.now())) {
    return "La fecha de inicio no puede estar en el futuro";
  }
  return null;
}

String? validateEndDate(DateTime? value) {
  if (value != null && value.isBefore(DateTime.now())) {
    return "La fecha de fin no puede estar en el pasado";
  }
  return null;
}