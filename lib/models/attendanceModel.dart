class AttendanceModel {
  String? subject;
  String? period;
  String? date;
  String? otp;
  AttendanceModel({this.subject, this.period, this.date, this.otp});

  factory AttendanceModel.fromMap(map) {
    return AttendanceModel(
        subject: map['subject'], period: map['period'], date: map['date']);
  }
  // sending data to our server
  Map<String, dynamic> toMap() {
    return {'subject': subject, 'period': period, 'date': date};
  }
}
