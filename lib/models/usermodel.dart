class UserModel {
  String? userId;
  String? uId;
  String? password;
  String? userName;
  String? department;
  String? email;
  String? section;

  UserModel(
      {this.userId,
      this.uId,
      this.password,
      this.userName,
      this.department,
      this.email,
      this.section});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
        userId: map['userId'],
        uId: map['uId'],
        password: map['password'],
        userName: map['userName'],
        department: map['department'],
        email: map['email'],
        section: map['section']);
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'uId': uId,
      'password': password,
      'userName': userName,
      'department': department,
      'email': email,
      'section': section
    };
  }
}
