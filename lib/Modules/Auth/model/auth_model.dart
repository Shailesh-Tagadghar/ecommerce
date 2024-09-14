class AuthModel {
  String? name;
  String? email;
  String? password;
  String? fcmToken;
  String? gender;
  String? number;
  String? image;
  String? address;
  String? loginType = 'Email';

  AuthModel({
    this.name,
    this.email,
    this.password,
    this.fcmToken,
    this.gender,
    this.number,
    this.image,
    this.address,
    this.loginType,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'fcm_token': fcmToken,
      'gender': gender,
      'number': number,
      'image': image,
      'address': address,
      'login_type': loginType,
    };
  }
}
