import 'dart:convert';

import 'package:apiofa_mob/features/promotion_management/data/models/promotion.dart';

class Purchase {
  final int id;
  final DateTime purchaseDate;
  final double amount;
  final int subscriptionTypeId;
  final int? creatorProfileId;
  final int? mediaPackId;
  final bool usesPromotion;
  final int? promotionId;
  final int purchaseStatusId;
  final String? statusMessage;
  final DateTime validFrom;
  final int validForDays;
  PurchaseStatus purchaseStatus;

  Purchase({
    required this.id,
    required this.purchaseDate,
    required this.amount,
    required this.subscriptionTypeId,
    this.creatorProfileId,
    this.mediaPackId,
    this.usesPromotion = false,
    this.promotionId,
    required this.purchaseStatusId,
    this.statusMessage,
    required this.validFrom,
    required this.validForDays,
    required this.purchaseStatus,
  });

  DateTime get validTo => validFrom.add(Duration(days: validForDays));

  void validateSubscriptionTarget() {
    if (subscriptionTypeId == 1 && mediaPackId == null) {
      throw ArgumentError("Ingrese un Id de pack para una promoción de pack");
    }

    if ((subscriptionTypeId == 2 || subscriptionTypeId == 3) &&
        creatorProfileId == null) {
      throw ArgumentError(
          "Ingrese un Id de Creador para una promoción de suscripción a un perfil");
    }

    if (mediaPackId != null && creatorProfileId != null) {
      throw ArgumentError(
          "Ingrese un Id de creador o Id de Pack, no ambos");
    }
  }

  void validatePromotionTarget(Promotion promotion) {
    if (promotion.mediaPackId != null && promotion.mediaPackId != mediaPackId) {
      throw ArgumentError(
          "La promoción que se intenta ingresar no es la correspondiente al pack que se intenta adquirir");
    }
    if (promotion.creatorProfileId != null &&
        promotion.mediaPackId != creatorProfileId) {
      throw ArgumentError(
          "La promoción que se intenta ingresar no es la correspondiente al creador al que se intenta suscribir");
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'purchaseDate': purchaseDate.toIso8601String(),
      'amount': amount,
      'subscriptionTypeId': subscriptionTypeId,
      'creatorProfileId': creatorProfileId,
      'mediaPackId': mediaPackId,
      'usesPromotion': usesPromotion,
      'promotionId': promotionId,
      'purchaseStatusId': purchaseStatusId,
      'statusMessage': statusMessage,
      'validFrom': validFrom.toIso8601String(),
      'validForDays': validForDays,
      'purchaseStatus': purchaseStatus.toMap(),
    };
  }

  factory Purchase.fromMap(Map<String, dynamic> map) {
    return Purchase(
      id: map['id'] ?? 0,
      purchaseDate: DateTime.parse(map['purchaseDate'] ?? ''),
      amount: map['amount'] ?? 0.0,
      subscriptionTypeId: map['subscriptionTypeId'] ?? 0,
      creatorProfileId: map['creatorProfileId'],
      mediaPackId: map['mediaPackId'],
      usesPromotion: map['usesPromotion'] ?? false,
      promotionId: map['promotionId'],
      purchaseStatusId: map['purchaseStatusId'] ?? 0,
      statusMessage: map['statusMessage'],
      validFrom: DateTime.parse(map['validFrom'] ?? ''),
      validForDays: map['validForDays'] ?? 0,
      purchaseStatus: PurchaseStatus.fromMap(map['purchaseStatus']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Purchase.fromJson(String source) =>
      Purchase.fromMap(json.decode(source));
}

class PurchaseStatus {
  final int id;
  final String name;
  final String description;

  PurchaseStatus({
    required this.id,
    required this.name,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }

  factory PurchaseStatus.fromMap(Map<String, dynamic> map) {
    return PurchaseStatus(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PurchaseStatus.fromJson(String source) =>
      PurchaseStatus.fromMap(json.decode(source));
}