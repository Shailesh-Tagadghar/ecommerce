import 'dart:convert';
import 'package:ecommerce/Utils/Constants/api_constants.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://fashionapp.idealake.com/api/';

  //register
  Future<void> registerUser(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/$ApiConstants.register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to register user');
    }
  }

  // login
  Future<void> loginUser(String email, String password, String fcmToken) async {
    final response = await http.post(
      Uri.parse('$baseUrl/$ApiConstants.login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(
          {'email': email, 'password': password, 'fcm_token': fcmToken}),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to login');
    }
  }

  //fetch_user_details into profile page
  // Future<Map<String, dynamic>> fetchProfile(String token) async {
  //   final response = await http.get(
  //     Uri.parse('$baseUrl/profile'),
  //     headers: {'Authorization': 'Bearer $token'},
  //   );
  //   if (response.statusCode == 200) {
  //     return jsonDecode(response.body);
  //   } else {
  //     throw Exception('Failed to fetch profile');
  //   }
  // }
}
