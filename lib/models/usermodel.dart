class UserModel {
  String? userId;
  String? password;
  String? userName;
  String? department;
  String? email;
  String? section;

  UserModel(
      {this.userId,
      this.password,
      this.userName,
      this.department,
      this.email,
      this.section});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
        userId: map['userId'],
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
      'password': password,
      'userName': userName,
      'department': department,
      'emai': email,
      'section': section
    };
  }
}
