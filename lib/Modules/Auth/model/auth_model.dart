class AuthModel {
  String? name;
  String? email;
  String? password;
  String? fcmToken;
  String? gender;
  String? phone;
  String? image;
  String? address;

  AuthModel({
    this.name,
    this.email,
    this.password,
    this.fcmToken,
    this.gender,
    this.phone,
    this.image,
    this.address,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'fcm_token': fcmToken,
      'gender': gender,
      'phone': phone,
      'image': image,
      'address': address,
    };
  }
}
