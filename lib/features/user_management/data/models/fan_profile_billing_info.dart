import 'dart:convert';

import 'package:apiofa_mob/features/user_management/data/models/fan_profile.dart';

class FanProfileBillingInfo {
  final int id;
  final String mercadoPagoCardToken;
  final int fanProfileId;
  final FanProfile fanProfile;

  FanProfileBillingInfo({
    required this.id,
    required this.mercadoPagoCardToken,
    required this.fanProfileId,
    required this.fanProfile,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'mercadoPagoCardToken': mercadoPagoCardToken,
      'fanProfileId': fanProfileId,
      'fanProfile': fanProfile.toMap(),
    };
  }

  factory FanProfileBillingInfo.fromMap(Map<String, dynamic> map) {
    return FanProfileBillingInfo(
      id: map['id'] ?? 0,
      mercadoPagoCardToken: map['mercadoPagoCardToken'] ?? '',
      fanProfileId: map['fanProfileId'] ?? 0,
      fanProfile: FanProfile.fromMap(map['fanProfile']),
    );
  }

  String toJson() => json.encode(toMap());

  factory FanProfileBillingInfo.fromJson(String source) => FanProfileBillingInfo.fromMap(json.decode(source));

  FanProfileBillingInfo copyWith({
    int? id,
    String? mercadoPagoCardToken,
    int? fanProfileId,
    FanProfile? fanProfile,
    
  }) {
    return FanProfileBillingInfo(
      id: id ?? this.id,
      mercadoPagoCardToken: mercadoPagoCardToken ?? this.mercadoPagoCardToken,
      fanProfileId: fanProfileId ?? this.fanProfileId,
      fanProfile: fanProfile ?? this.fanProfile,
    );
  }
}

// Validation methods

String? validateMercadoPagoCardToken(String value) {
  if (value.isEmpty) {
    return "El token de la tarjeta es obligatorio.";
  }
  return null;
}

String? validateFanProfileId(int value) {
  if (value <= 0) {
    return "El ID del perfil de fan no es válido.";
  }
  return null;
}