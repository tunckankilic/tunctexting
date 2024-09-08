import 'dart:convert';

import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class GroupC {
  final String senderId;
  final String name;
  final String groupId;
  final String groupPic;
  final String lastMessage;
  final List<String> membersUid;
  final DateTime timeSent;
  GroupC({
    required this.senderId,
    required this.name,
    required this.groupId,
    required this.groupPic,
    required this.lastMessage,
    required this.membersUid,
    required this.timeSent,
  });

  GroupC copyWith({
    String? senderId,
    String? name,
    String? groupId,
    String? groupPic,
    String? lastMessage,
    List<String>? membersUid,
    DateTime? timeSent,
  }) {
    return GroupC(
      senderId: senderId ?? this.senderId,
      name: name ?? this.name,
      groupId: groupId ?? this.groupId,
      groupPic: groupPic ?? this.groupPic,
      lastMessage: lastMessage ?? this.lastMessage,
      membersUid: membersUid ?? this.membersUid,
      timeSent: timeSent ?? this.timeSent,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'senderId': senderId,
      'name': name,
      'groupId': groupId,
      'groupPic': groupPic,
      'lastMessage': lastMessage,
      'membersUid': membersUid,
      'timeSent': timeSent.millisecondsSinceEpoch,
    };
  }

  @override
  bool operator ==(covariant GroupC other) {
    if (identical(this, other)) return true;

    return other.senderId == senderId &&
        other.name == name &&
        other.groupId == groupId &&
        other.groupPic == groupPic &&
        other.lastMessage == lastMessage &&
        listEquals(other.membersUid, membersUid) &&
        other.timeSent == timeSent;
  }

  @override
  int get hashCode {
    return senderId.hashCode ^
        name.hashCode ^
        groupId.hashCode ^
        groupPic.hashCode ^
        lastMessage.hashCode ^
        membersUid.hashCode ^
        timeSent.hashCode;
  }
}
