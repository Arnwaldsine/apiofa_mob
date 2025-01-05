import 'dart:convert';

import 'package:apiofa_mob/features/user_management/data/models/application_user.dart';

class UserBlock {
  final int id;
  final String blockerId;
  final ApplicationUser blocker;
  final String blockedId;
  final ApplicationUser blocked;
  final DateTime blockDate;
  final String? comment;

  UserBlock({
    required this.id,
    required this.blockerId,
    required this.blocker,
    required this.blockedId,
    required this.blocked,
    required this.blockDate,
    this.comment,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'blockerId': blockerId,
      'blocker': blocker.toMap(),
      'blockedId': blockedId,
      'blocked': blocked.toMap(),
      'blockDate': blockDate.toIso8601String(),
      'comment': comment,
    };
  }

  factory UserBlock.fromMap(Map<String, dynamic> map) {
    return UserBlock(
      id: map['id'] ?? 0,
      blockerId: map['blockerId'] ?? '',
      blocker: ApplicationUser.fromMap(map['blocker']),
      blockedId: map['blockedId'] ?? '',
      blocked: ApplicationUser.fromMap(map['blocked']),
      blockDate: DateTime.parse(map['blockDate']),
      comment: map['comment'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserBlock.fromJson(String source) => UserBlock.fromMap(json.decode(source));

  UserBlock copyWith({
    int? id,
    String? blockerId,
    ApplicationUser? blocker,
    String? blockedId,
    ApplicationUser? blocked,
    DateTime? blockDate,
    String? comment,
  }) {
    return UserBlock(
      id: id ?? this.id,
      blockerId: blockerId ?? this.blockerId,
      blocker: blocker ?? this.blocker,
      blockedId: blockedId ?? this.blockedId,
      blocked: blocked ?? this.blocked,
      blockDate: blockDate ?? this.blockDate,
      comment: comment ?? this.comment,
    );
  }
}