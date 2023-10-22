// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class HandRiseModel {
  final String studentId;
  final String id;
  final DateTime risedTime;
  final bool isResponded;
  final String tutorId;
  final String waitingTime;
  HandRiseModel(
      {required this.studentId,
      required this.id,
      required this.risedTime,
      required this.isResponded,
      required this.tutorId,
      required this.waitingTime});

  HandRiseModel copyWith(
      {String? studentId,
      String? id,
      DateTime? risedTime,
      bool? isResponded,
      String? tutorId,
      String? waitingTime}) {
    return HandRiseModel(
        studentId: studentId ?? this.studentId,
        id: id ?? this.id,
        risedTime: risedTime ?? this.risedTime,
        isResponded: isResponded ?? this.isResponded,
        tutorId: tutorId ?? this.tutorId,
        waitingTime: waitingTime ?? this.waitingTime);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'studentId': studentId,
      'id': id,
      'risedTime': DateTime.now(),
      'isResponded': isResponded,
      'tutorId': tutorId,
      'waitingTime': waitingTime
    };
  }

  factory HandRiseModel.fromMap(Map<String, dynamic> map) {
    return HandRiseModel(
        studentId: map['studentId'] ?? "",
        id: map['id'] ?? "",
        risedTime: map["risedTime"].toDate(),
        isResponded: map['isResponded'] ?? false,
        tutorId: map['tutorId'] ?? "",
        waitingTime: map["waitingTime"] ?? "");
  }

  String toJson() => json.encode(toMap());

  factory HandRiseModel.fromJson(String source) =>
      HandRiseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HandRiseModel(studentId: $studentId, id: $id, risedTime: $risedTime, isResponded: $isResponded, tutorId: $tutorId)';
  }

  @override
  bool operator ==(covariant HandRiseModel other) {
    if (identical(this, other)) return true;

    return other.studentId == studentId &&
        other.id == id &&
        other.risedTime == risedTime &&
        other.isResponded == isResponded &&
        other.tutorId == tutorId;
  }

  @override
  int get hashCode {
    return studentId.hashCode ^
        id.hashCode ^
        risedTime.hashCode ^
        isResponded.hashCode ^
        tutorId.hashCode;
  }
}
