import 'package:apiofa_mob/features/content_management/data/models/media_pack.dart';
import 'package:apiofa_mob/features/promotion_management/data/models/promotion_type.dart';
import 'package:apiofa_mob/features/user_management/data/models/creator_profile.dart';

class Promotion {
  final int id;
  final int promotionTypeId;
  final PromotionType promotionType;
  final DateTime startDate;
  final DateTime endDate;
  final double? discountAmount;
  final int? discountPercentage;
  final String? promotionCode;
  final int? mediaPackId;
  final MediaPack? mediaPack;
  final int? creatorProfileId;
  final CreatorProfile? creatorProfile;

  Promotion({
    required this.id,
    required this.promotionTypeId,
    required this.promotionType,
    required this.startDate,
    required this.endDate,
    required this.discountAmount,
    required this.discountPercentage,
    required this.promotionCode,
    required this.mediaPackId,
    required this.mediaPack,
    required this.creatorProfileId,
    required this.creatorProfile,
  });

  String? validateDiscount() {
    if ((discountAmount == null && discountPercentage == null) ||
        (discountAmount != null && discountPercentage != null)) {
      return "Debe proporcionar un porcentaje de descuento o un monto de descuento, pero no ambos.";
    }
    return null;
  }

  String? validateSubscriptionTarget() {
    if (promotionTypeId == 1 && mediaPackId == null) {
      return "Ingrese un Id de pack para una promoción de pack";
    }

    if ((promotionTypeId == 2 || promotionTypeId == 3) && creatorProfileId == null) {
      return "Ingrese un Id de Creador para una promoción de suscripción a un perfil";
    }

    if (mediaPackId != null && creatorProfileId != null) {
      return "Ingrese un Id de creador o Id de Pack, no ambos";
    }

    return null;
  }
}