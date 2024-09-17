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

  // Convert the object to JSON
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

  // Create an object from JSON
  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      fcmToken: json['fcm_token'],
      gender: json['gender'],
      number: json['number'],
      image: json['image'],
      address: json['address'],
      loginType: json['login_type'],
    );
  }
}
