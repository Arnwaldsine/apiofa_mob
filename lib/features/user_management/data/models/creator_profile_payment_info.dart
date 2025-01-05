import 'dart:convert';

import 'package:apiofa_mob/features/payment_processing/data/models/payment_method.dart';
import 'package:apiofa_mob/features/user_management/data/models/creator_profile.dart';

class CreatorProfilePaymentInfo {
  final int id;
  final int creatorProfileId;
  final CreatorProfile creatorProfile;
  final int paymentMethodId;
  final PaymentMethod preferredPaymentMethod;
  final String mercadoPagoAccountId;
  final String bankAccountNumber;
  final String bankName;

  CreatorProfilePaymentInfo({
    required this.id,
    required this.creatorProfileId,
    required this.creatorProfile,
    required this.paymentMethodId,
    required this.preferredPaymentMethod,
    required this.mercadoPagoAccountId,
    required this.bankAccountNumber,
    required this.bankName,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'creatorProfileId': creatorProfileId,
      'creatorProfile': creatorProfile.toMap(),
      'paymentMethodId': paymentMethodId,
      'preferredPaymentMethod': preferredPaymentMethod.toMap(),
      'mercadoPagoAccountId': mercadoPagoAccountId,
      'bankAccountNumber': bankAccountNumber,
      'bankName': bankName,
    };
  }

  factory CreatorProfilePaymentInfo.fromMap(Map<String, dynamic> map) {
    return CreatorProfilePaymentInfo(
      id: map['id'] ?? 0,
      creatorProfileId: map['creatorProfileId'] ?? 0,
      creatorProfile: CreatorProfile.fromMap(map['creatorProfile']),
      paymentMethodId: map['paymentMethodId'] ?? 0,
      preferredPaymentMethod: PaymentMethod.fromMap(map['preferredPaymentMethod']),
      mercadoPagoAccountId: map['mercadoPagoAccountId'] ?? '',
      bankAccountNumber: map['bankAccountNumber'] ?? '',
      bankName: map['bankName'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CreatorProfilePaymentInfo.fromJson(String source) =>
      CreatorProfilePaymentInfo.fromMap(json.decode(source));

  CreatorProfilePaymentInfo copyWith({
    int? id,
    int? creatorProfileId,
    CreatorProfile? creatorProfile,
    int? paymentMethodId,
    PaymentMethod? preferredPaymentMethod,
    String? mercadoPagoAccountId,
    String? bankAccountNumber,
    String? bankName,
  }) {
    return CreatorProfilePaymentInfo(
      id: id ?? this.id,
      creatorProfileId: creatorProfileId ?? this.creatorProfileId,
      creatorProfile: creatorProfile ?? this.creatorProfile,
      paymentMethodId: paymentMethodId ?? this.paymentMethodId,
      preferredPaymentMethod: preferredPaymentMethod ?? this.preferredPaymentMethod,
      mercadoPagoAccountId: mercadoPagoAccountId ?? this.mercadoPagoAccountId,
      bankAccountNumber: bankAccountNumber ?? this.bankAccountNumber,
      bankName: bankName ?? this.bankName,
    );
  }
}

// Validation methods

String? validateMercadoPagoAccountId(String value) {
  if (value.isEmpty) {
    return "El ID de la cuenta de MercadoPago es obligatorio.";
  }
  return null;
}

String? validateBankAccountNumber(String value) {
  if (value.isEmpty) {
    return "El número de cuenta bancaria es obligatorio.";
  }
  if (value.length < 10) {
    return "El número de cuenta bancaria debe tener al menos 10 caracteres.";
  }
  return null;
}

String? validateBankName(String value) {
  if (value.isEmpty) {
    return "El nombre del banco es obligatorio.";
  }
  return null;
}