import 'dart:convert';
import 'package:ecommerce/Modules/Auth/services/fcm_service.dart';
import 'package:ecommerce/Utils/Constants/api_constants.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://fashionapp.idealake.com/api';

  //register
  // Future<void> registerUser(Map<String, dynamic> data) async {
  //   try {
  //     final response = await http.post(
  //       Uri.parse('$baseUrl/${ApiConstants.register}'),
  //       headers: {'Content-Type': 'application/json'},
  //       body: jsonEncode(data),
  //     );
  //     if (response.statusCode == 200) {
  //       // Handle successful registration
  //       print('User registered successfully');
  //     } else {
  //       print('Error registering user: ${response.statusCode}');
  //       print('Response body: ${response.body}');
  //       throw Exception('Failed to register user');
  //     }
  //   } catch (e) {
  //     print('Exception: $e');
  //   }
  // }

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

  // Future<void> registerUser(Map<String, dynamic> userData, File? image) async {
  //   if (userData['signup_data'] == null ||
  //       userData['signup_data']['email'] == null ||
  //       userData['signup_data']['password'] == null) {
  //     throw Exception('Invalid user data.');
  //   }

  //   var request = http.MultipartRequest(
  //       'POST', Uri.parse('$baseUrl/${ApiConstants.register}'))
  //     ..fields['name'] = userData['name']
  //     ..fields['email'] = userData['email']
  //     ..fields['password'] = userData['password'];

  //   // Attach the image if it's not null
  //   if (image != null) {
  //     request.files.add(await http.MultipartFile.fromPath('image', image.path));
  //   }

  //   var response = await request.send();
  //   // var responseBody = await response.stream.bytesToString();

  //   if (response.statusCode != 200) {
  //     var responseBody = await response.stream.bytesToString();
  //     throw Exception(
  //         'Failed to register user: ${response.statusCode}, Response body: $responseBody');
  //   }
  // }

  // login
  // Future<void> loginUser(String email, String password, String fcmToken) async {
  //   final response = await http.post(
  //     Uri.parse('$baseUrl/${ApiConstants.login}'),
  //     headers: {'Content-Type': 'application/json'},
  //     body: jsonEncode(
  //         {'email': email, 'password': password, 'fcm_token': fcmToken}),
  //   );
  //   if (response.statusCode != 200) {
  //     throw Exception('Failed to login');
  //   }
  // }
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
