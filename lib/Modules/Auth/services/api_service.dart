import 'dart:convert';
import 'package:ecommerce/Modules/Auth/services/fcm_service.dart';
import 'package:ecommerce/Utils/Constants/api_constants.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://fashionapp.idealake.com/api';

  // Register a user
  static Future<void> registerUser(Map<String, dynamic> data) async {
    final url = Uri.parse(
        '$baseUrl/${ApiConstants.register}'); // Replace with your API endpoint

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(data),
      );

      if (response.statusCode == 200) {
        // Handle successful registration
        final responseData = json.decode(response.body);
        print('Registration successful: ${responseData['message']}');
        return responseData;
      } else {
        // Handle server errors
        final errorData = json.decode(response.body);
        print('Registration failed: ${errorData['message']}');
        throw Exception('Failed to register user');
      }
    } catch (e) {
      // Handle network errors or unexpected issues
      print('Error during registration: $e');
      throw Exception('Failed to register user');
    }
  }

  // Get FCM token using FcmService
  static Future<String> getFcmToken() async {
    final fcmService = FcmService();
    return await fcmService.getFcmToken();
  }

  Future<void> loginUser(
      String email, String password, String? fcmToken) async {
    final response = await http.post(
      Uri.parse('$baseUrl/${ApiConstants.login}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
        'fcm_token': fcmToken,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to login: ${response.statusCode}');
    }
  }
}
